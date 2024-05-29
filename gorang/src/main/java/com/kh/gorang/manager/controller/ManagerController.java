package com.kh.gorang.manager.controller;

import static com.kh.gorang.common.template.SaveFileController.saveFile;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.gorang.shopping.model.vo.Product;
import com.kh.gorang.shopping.model.vo.ProductDetailOption;
import com.kh.gorang.shopping.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ManagerController {
	
	private final ProductService productService;
	
	@RequestMapping("enrollproduct.ma")
	public String managerProductEnrollForm() {
		return "manager/enrollProductForm";
	}
	
	@PostMapping("insert.po")
	public String insertProduct(
			MultipartFile upfile,
			Product product, 
			ProductDetailOption productOption,
			HttpSession session,
			Model model) {

		if(!upfile.getOriginalFilename().equals("")) {
			String changeFileName = saveFile(upfile, session, "/productimg/");
			product.setMainImg(changeFileName);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product", product);
		map.put("productOption", productOption);
		
		int result = productService.insertProduct(map);

		if(result > 0) {
			session.setAttribute("alertMsg", "상품을 성공적으로 등록하였습니다.");
			return "redirect:/enrollproduct.ma";

		} else {
			session.setAttribute("alertMsg", "상품 등록을 실패하였습니다. 다시 등록해주세요.");
			return "redirect:/enrollproduct.ma";
		}
		
	}
	
	
	
	@RequestMapping("updateproduct.ma")
	public String managerProductUpdateForm() {
		return "manager/updateProductForm";
	}
	

	@RequestMapping("boards.ma")
	public String managerBoardCheckForm() {
		return "manager/checkBoardForm";
	}
	
	@RequestMapping("members.ma")
	public String managerMemberForm() {
		return "manager/memberManagementForm";

	}
}
