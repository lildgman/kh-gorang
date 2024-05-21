package com.kh.gorang.shopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {

	@RequestMapping("store")
	public String storeMainForm() {
		return "shopping/shoppingMain";
	}
	
	@RequestMapping("store/list")
	public String storeList() {
		return "shopping/productList";
	}
	
	@RequestMapping("store/product")
	public String productDetailForm() {
		return "shopping/productDetailForm";
	}
	
	@RequestMapping("cart")
	public String storeCartForm() {
		return "shopping/shoppingCartForm";
	}
}
