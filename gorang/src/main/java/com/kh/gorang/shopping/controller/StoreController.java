package com.kh.gorang.shopping.controller;

import static com.kh.gorang.common.template.SaveFileController.saveFile;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.kh.gorang.common.template.Pagination;
import com.kh.gorang.common.vo.PageInfo;
import com.kh.gorang.member.model.vo.QnA;
import com.kh.gorang.member.model.vo.Review;
import com.kh.gorang.shopping.model.vo.Product;
import com.kh.gorang.shopping.model.vo.ProductDetailOption;
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
			String changeName = saveFile(mf,session,"/product/productdescimg/");
			changeNameList.add("/product/productdescimg/"+changeName);
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
	
	// 상품 상세 페이지 리턴하는 컨트롤러
	@RequestMapping("detail.po")
	public String productDetailForm(@RequestParam String pno, Model model) {
	    int productNo = Integer.parseInt(pno); 
	    Product p = productService.selectProductByProductNo(productNo);
	    
	    if (p == null) {
	        model.addAttribute("alertMsg", "조회 실패");
	        return "redirect:/list.po";
	    } else {
	        model.addAttribute("p", p);
	        return "shopping/productDetailForm";
	    }
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
	
	//ajax로 상품 문의 가져오는 메소드
	@ResponseBody
	@GetMapping(value = "ajaxQnA.po", produces = "application/json; charset=utf-8")
	public String ajaxSelectProductQnAs(@RequestParam("pno") String pno) {
		int productNo = Integer.parseInt(pno);
		ArrayList<QnA> qnas = productService.selectProductQnAsByPno(productNo);
		return new Gson().toJson(qnas);
	}
	
	// ajax 로 상품 옵션 가져오는 메소드
	@ResponseBody
	@GetMapping(value = "ajaxOpt.po", produces = "application/json; charset=utf-8")
	public String ajaxSelectProductOpts(@RequestParam("pno") String pno) {
		int productNo = Integer.parseInt(pno);
		ArrayList<ProductDetailOption> opts = productService.selectProductOptsByPno(productNo);
		return new Gson().toJson(opts);
	}
	
	
	@RequestMapping("insertQna.po")
	public String insertProductQna(@RequestParam int writerNo, @RequestParam int refProductNo,
								   @RequestParam int refPdoptNo, @RequestParam String qnaPhoto,
								   @RequestParam String qnaContent, HttpSession session) {
		QnA q = new QnA();
		q.setQnaContent(qnaContent);
		q.setQnaPhoto(qnaPhoto);
		q.setWriterNo(writerNo);
		q.setRefProductNo(refProductNo);
		q.setRefPdoptNo(refPdoptNo);
		
		
		int result = productService.insertProductQna(q);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "문의 등록 성공.");
			return "redirect:/";
		} else {
			session.setAttribute("alertMsg", "문의 등록 실패");
			return "redirect:/";
		}
	}
	
	
	@RequestMapping("cart")
	public String productCartForm() {
		return "shopping/shoppingCartForm";
	}
	
	// 상품 상세 페이지에서 바로 구매할 경우 사용하는 컨트롤러
	@PostMapping("order.po")
	public String productOrderForm(@RequestParam String selectedOptList,  Model model) {
		System.out.println(selectedOptList);
//		Gson gson = new Gson();
//		// Gson 으로 JSON.stringfy() 한 것을 다시 객체 형태로 변환하기(Gson.fromJson() 사용 / 정석은 dto 사용)
//		
//		// 1. JSON 형태를 List 로 변경하기
//		Type type = new TypeToken<List<ProductDetailOption>>(){}.getType();
//		// 2. Type 객체를 넣기
//		List<ProductDetailOption> opts = gson.fromJson(selectedOptList, type);
//		model.addAttribute("opts", opts);
		
		//그냥 list 형태로 보냄
		Gson gson = new Gson();
		Type type = new TypeToken<List>(){}.getType();
		List opts = gson.fromJson(selectedOptList, type);
		
		model.addAttribute("opts", opts);
		
		System.out.println(opts);
		
		return "shopping/shoppingOrderForm";
	}
	
	// 주문 데이터 처리하는 컨트롤러
	@ResponseBody
	@PostMapping(value = "insertOrder.po", produces = "application/json; charset=utf-8")
	public String aJaxInsertProductOrder(@RequestBody Map<String, Object> orderData, Model model) {
		// Gson을 사용하여 JSON 데이터를 처리
	    Gson gson = new Gson();
	    
	    // 각 데이터 파싱
	    String orderInfoJson = gson.toJson(orderData.get("orderInfo"));
	    String orderOptsJson = gson.toJson(orderData.get("orderOpts"));

	    System.out.println("Order Info: " + orderInfoJson);
	    System.out.println("Order Options: " + orderOptsJson);
		
	    //JSON을 Java 객체로 변환
	    Type orderInfoType = new TypeToken<List<Order>>(){}.getType();
	    Type orderOptsType = new TypeToken<List<Map<String, Object>>>(){}.getType();

	    Map<String, Object> orderInfo = gson.fromJson(orderInfoJson, orderInfoType);
	    List<Map<String, Object>> orderOpts = gson.fromJson(orderOptsJson, orderOptsType);

	    System.out.println("Parsed Order Info: " + orderInfo);
	    System.out.println("Parsed Order Options: " + orderOpts);
		
		
		return null;
	}
}
