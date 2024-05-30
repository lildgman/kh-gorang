package com.kh.gorang.shopping.controller;

import static com.kh.gorang.common.template.SaveFileController.saveFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.gorang.common.template.Pagination;
import com.kh.gorang.common.vo.PageInfo;
import com.kh.gorang.member.model.vo.Member;
import com.kh.gorang.member.model.vo.Review;
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
	public String storeList(
				@RequestParam(defaultValue="1") int cpage,
				@RequestParam(defaultValue="all") String category,
				@RequestParam(defaultValue="default") String sort,
				Model model) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("category",category);
		map.put("sort", sort);
		
		// category와 sort를 가지고 상품들 조회
		int productCount = productService.selectProductCount(map);
		
		PageInfo pi = Pagination.getPageInfo(productCount, cpage, 10, 20);
		
		log.info("productCount={}",productCount);
		log.info("cpage={}",cpage);
		log.info("category={}",category);
		log.info("sort={}",sort);
		log.info("pi={}", pi);
		
		ArrayList<Product> list = productService.selectResultProductList(pi, map);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		return "shopping/productList";
	}
	
	@RequestMapping("detail.po")
	public String productDetailForm(@RequestParam String pno) {
		log.info("pno = {}" , pno );
		return "shopping/productDetailForm";
	}
	
	// ajax 로 product 객체 가져오는 메소드
	@ResponseBody
	@GetMapping(value = "ajaxDetail.po", produces = "application/json; charset=utf-8")
	public String ajaxSelectProduct(@RequestParam("pno") String pno) {
		int productNo = Integer.parseInt(pno);
		Product p = productService.selectProductByProductNo(productNo);
		return new Gson().toJson(p);
	}
	
	// ajax로 상품 리뷰 가져오는 메소드
	@ResponseBody
	@GetMapping(value = "ajaxReview.po", produces = "application/json; charset=utf-8")
	public String ajaxSelectProductReviews(@RequestParam("pno") String pno) {
		int productNo = Integer.parseInt(pno);
		ArrayList<Review> reviews = productService.selectProductReviewsByPno(productNo);
		return new Gson().toJson(reviews);
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
