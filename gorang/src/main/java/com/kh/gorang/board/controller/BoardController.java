package com.kh.gorang.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	@RequestMapping("main.bo")
	public String boardMain() {
		return "board/boardMain";
	}
	
	@RequestMapping("write.bo")
	public String commonWrite() {
		return "board/commonWrite";
	}
	
	@RequestMapping("detail.bo")
	public String boardDetail() {
		return "board/boardDetail";
		
	}
}
