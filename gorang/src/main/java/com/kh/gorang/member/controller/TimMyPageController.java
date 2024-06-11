package com.kh.gorang.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.gorang.member.model.vo.Member;
import com.kh.gorang.shopping.model.vo.OrderPdopt;
import com.kh.gorang.shopping.service.OrderService;



@Controller
public class TimMyPageController {
	
	
	@Autowired
	private OrderService orderService; 
	
	//구매내역
	@RequestMapping("buyList.me")
	public String myPageBuyList(HttpSession session, Model model){
		// 로그인한 유저 정보 가져옴
		Member m = (Member)session.getAttribute("loginUser");
		// m.memberNo 로  DB 내에 Order 테이블 정보 조회
		ArrayList<OrderPdopt> orderPdopts = orderService.selectOrderPdOptsByMemberNo(m.getMemberNo());
		
		model.addAttribute("orderPdopts", orderPdopts);
		
		return "member/myPageBuyList";
	}
	
	// 나의 냉장고 식재료 추가하기
	@ResponseBody
	@RequestMapping("insertIngre.me")
	public String insertIngredient() {
		
		return null;
	}
	
}
