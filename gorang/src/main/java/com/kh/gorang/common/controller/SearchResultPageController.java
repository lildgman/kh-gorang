package com.kh.gorang.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchResultPageController {
	@RequestMapping("result.sr")
	public String  SearchResultPage() {
		return "common/searchResultPage";
		
	}
}
