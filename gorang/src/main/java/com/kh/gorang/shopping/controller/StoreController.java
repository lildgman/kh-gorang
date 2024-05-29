package com.kh.gorang.shopping.controller;

import static com.kh.gorang.common.SaveFileController.saveFile;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.gorang.shopping.model.vo.Product;
import com.kh.gorang.shopping.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class StoreController {
	
	private final ProductService productService;
	
	// 상품 설명에 들어가는 이미지 저장하는 메서드
	@PostMapping("detaildesc")
	@ResponseBody
	public String uploadDetailDesc(List<MultipartFile> fileList, HttpSession session) {
		
		List<String> changeNameList = new ArrayList<String>();
		for(MultipartFile mf : fileList) {
			String changeName = saveFile(mf,session,"/productdescimg/");
			changeNameList.add("/productdescimg/"+changeName);
		}
		return new Gson().toJson(changeNameList);
	}

	// 쇼핑 메인화면
	@RequestMapping("main.po")
	public String storeMain(Model model) {
		// 가장 많이 팔린 상품 4개 조회
		ArrayList<Product> bestSellerList = productService.selectBestSellerList(); 
		
		// 최근에 입고된 상품 4개 조회
		ArrayList<Product> recentProductList = productService.selectRecentProductList();
		
		model.addAttribute("bestSellerList", bestSellerList);
		model.addAttribute("recentProductList", recentProductList);
		
		return "shopping/shoppingMain";
	}
	
	@RequestMapping("list.po")
	public String storeList() {
		return "shopping/productList";
	}
	
	@RequestMapping("detail.po")
	public String productDetailForm() {
		return "shopping/productDetailForm";
	}
	
	@RequestMapping("cart")
	public String productCartForm() {
		return "shopping/shoppingCartForm";
	}
	
	@RequestMapping("order")
	public String productOrderForm() {
		return "shopping/shoppingOrderForm";
	}
}
