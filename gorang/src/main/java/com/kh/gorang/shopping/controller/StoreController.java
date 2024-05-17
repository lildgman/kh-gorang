package com.kh.gorang.shopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {

	@RequestMapping("store")
	public String storeMainForm() {
		return "shopping/shoppingMain";
	}
}
