package com.kh.gorang.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.gorang.shopping.service.ODGProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ManagerController {
	
	private final ODGProductService odgProductService;
	
	@RequestMapping("enrollproduct.ma")
	public String managerProductEnrollForm() {
		return "manager/enrollProductForm";
	}
	
	@RequestMapping("updateproduct.ma")
	public String managerProductUpdateForm(Model model) {
		
		// 상품 전체 개수
		int allProductQuantity = odgProductService.selectAllProductQuantity();
		// 판매중인 상품 개수
		int saleProductQuantity = odgProductService.selectSaleProductQuantity();
		// 일시품절인 상품 개수
		int shortageProductQuantity = odgProductService.selectShortageProductQuantity();
		// 판매정지된 상품 개수
		int suspendedProductQuantity = odgProductService.selectSuspendedProductQuantity();

		
		model.addAttribute("allProductQuantity", allProductQuantity);
		model.addAttribute("saleProductQuantity", saleProductQuantity);
		model.addAttribute("shortageProductQuantity", shortageProductQuantity);
		model.addAttribute("suspendedProductQuantity", suspendedProductQuantity);
		
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
