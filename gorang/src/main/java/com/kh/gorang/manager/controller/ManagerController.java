package com.kh.gorang.manager.controller;

import static com.kh.gorang.common.template.SaveFileController.saveFile;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.gorang.shopping.model.vo.ProductInsertDTO;
import com.kh.gorang.shopping.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ManagerController {
	
	@Autowired
	private final ProductService productService;
	
	@RequestMapping("enrollproduct.ma")
	public String managerProductEnrollForm() {
		return "manager/enrollProductForm";
	}
	
	@RequestMapping("updateproduct.ma")
	public String managerProductUpdateForm() {
		
		// 상품 전체 개수
		int allProductQuantity = productService.selectAllProductQuantity();
		log.info("allProductQuantity={}",allProductQuantity);
		// 판매중인 상품 개수
		int saleProductQuantity = productService.selectSaleProductQuantity();
		
		// 일시품절인 상품 개수
		
		// 판매정지된 상품 개수
		
		
		
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
