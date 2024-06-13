package com.kh.gorang.shopping.controller;

import static com.kh.gorang.common.template.SaveFileController.saveFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.gorang.common.model.vo.PageInfo;
import com.kh.gorang.common.template.Pagination;
import com.kh.gorang.shopping.model.vo.Product;
import com.kh.gorang.shopping.model.vo.ProductDetailOption;
import com.kh.gorang.shopping.model.vo.ProductInsertDTO;
import com.kh.gorang.shopping.service.ODGProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ODGProductController {
	
	private final ODGProductService odgProductService;
	
	// 상품 등록
	@PostMapping("insert.po")
	public String insertProduct(
			MultipartFile upfile,
			ProductInsertDTO productDTO,
			HttpSession session,
			Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeFileName = saveFile(upfile, session, "/product/productimg/");
			productDTO.setMainImg(changeFileName);
		}
				
		int result = odgProductService.insertProduct(productDTO);

		if(result > 0) {
			session.setAttribute("alertMsg", "상품을 성공적으로 등록하였습니다.");
			return "redirect:/enrollproduct.ma";

		} else {
			session.setAttribute("alertMsg", "상품 등록을 실패하였습니다. 다시 등록해주세요.");
			return "redirect:/enrollproduct.ma";
		}
	}
	
	
	// 상품 검색
	@GetMapping("search.po")
	@ResponseBody
	public Map<String, Object> ajaxSearchProduct(
			@RequestParam(defaultValue = "1") int cpage,
			String searchProductName) {
		
		int searchProductResultCount = odgProductService.getSearchProductResultCount(searchProductName);
		
		log.info("searchProductResultCount={}",searchProductResultCount);
		PageInfo pi = Pagination.getPageInfo(searchProductResultCount, cpage, 10, 20);
		
		ArrayList<Product> resultList = odgProductService.ajaxSearchProduct(pi, searchProductName);
		
		Map<String, Object> map = new HashMap<>();
		map.put("resultList", resultList);
		map.put("pi", pi);
		
		
		return map;
	}
	
	//상품 옵션 조
	@GetMapping("option.po")
	@ResponseBody
	public ArrayList<ProductDetailOption> ajaxSearchProductOption(int productNo) {
		
		//옵션은 여러개 있을 수 있으니 list로 받아주자.
		ArrayList<ProductDetailOption> resultList = odgProductService.ajaxSearchProductOption(productNo);
		
		return resultList;
	}
	
	// 상품 상태 변경
	@PostMapping("update-status.po")
	@ResponseBody
	public String ajaxUpdateProductStatus(@RequestParam int productNo) {
		
		int result = odgProductService.ajaxUpdateProductStatus(productNo);
		
		if(result > 0) {
			return "done";
		} else {
			return "undone";
		}
	}
	
	// 상품 옵션 변경 
	@PostMapping("update-option.po")
	@ResponseBody
	public String ajaxUpdateProductOptions(@RequestBody ArrayList<ProductDetailOption> productDetailOptions) {
		log.info("list = {}", productDetailOptions);
		int result = odgProductService.ajaxUpdateProductOptions(productDetailOptions);
		
		if(result > 0 ) {
			return "done";
		} else {
			return "undone";
		}
	}
	
	
}
