package com.kh.gorang.shopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {

	@RequestMapping("main.st")
	public String storeMainForm() {
		return "shopping/shoppingMain";
	}
	
	@RequestMapping("list.st")
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
