package com.kh.gorang.member.controller;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberScrapBoardController {
	
	@RequestMapping("mypage/scrap/board")
	public String myPageScrapBoard(){
		return "member/myPageScrapBoard";
	}
	
}


