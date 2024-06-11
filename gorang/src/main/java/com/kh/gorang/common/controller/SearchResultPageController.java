package com.kh.gorang.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SearchResultPageController {
	
	@GetMapping("search.re")
	public String  SearchResultPage() {
		return "common/searchResultPage";
	}
}
