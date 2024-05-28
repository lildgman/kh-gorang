package com.kh.gorang.manager.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.gorang.shopping.model.vo.Product;
import com.kh.gorang.shopping.model.vo.ProductDetailOption;

@Controller
public class ManagerController {
	
	@RequestMapping("enrollproduct.ma")
	public String managerProductEnrollForm() {
		return "manager/enrollProductForm";
	}
	
	@PostMapping("insert.po")
	public String insertProduct(
			Product product, 
			ProductDetailOption productOption,
			HttpSession session,
			Model model) {
		
		System.out.println(product);
		System.out.println(productOption);
		
		return "redirect:/";
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
