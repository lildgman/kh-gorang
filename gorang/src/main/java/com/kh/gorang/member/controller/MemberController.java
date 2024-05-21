package com.kh.gorang.member.controller;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@RequestMapping("myPageAllView.me")
	public String myPageViewAll(){
		return "member/myPageAllView";
	}
	
	
	@RequestMapping("myRecipeBoard.me")
	public String myRecipeBoard(){
		return "member/myRecipeBoard";
	}
	
	@RequestMapping("myPageInfoEdit.me")
	public String myPageInfoEdit(){
		return "member/myPageInfoEdit";
	}
	@RequestMapping("myPageWithDraw.me")
	public String myPageWithDraw(){
		return "member/myPageWithDraw";
	}
}


