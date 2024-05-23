package com.kh.gorang.member.controller;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberScrapRecipeController {
	
	@RequestMapping("myPageScrapRecipe.me")
	public String myPageScrapRecipe(){
		return "member/myPageScrapRecipe";
	}
	
}


