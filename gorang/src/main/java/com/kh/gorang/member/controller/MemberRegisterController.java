package com.kh.gorang.member.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberRegisterController {
	@RequestMapping("Register.me")
	public String storeMainForm() {
		return "member/registerPage";
	}
	
}