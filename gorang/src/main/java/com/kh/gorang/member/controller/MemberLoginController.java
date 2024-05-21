package com.kh.gorang.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberLoginController {
	@RequestMapping("Login.me")
	public String myPageQnAView(){
		return "member/loginPage";
	}
	
	
}
