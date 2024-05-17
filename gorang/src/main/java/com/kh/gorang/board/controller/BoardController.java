package com.kh.gorang.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	@RequestMapping("main.bo")
	public String shoppingMain() {
		return "board/boardMain";
		
	}
}
