package com.kh.gorang.member.controller;

import java.lang.reflect.Type;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.kh.gorang.common.model.vo.PageInfo;
import com.kh.gorang.common.template.Pagination;
import com.kh.gorang.member.model.vo.Member;
import com.kh.gorang.member.model.vo.RefrigeratorInsertDTO;
import com.kh.gorang.member.service.MyPageService;
import com.kh.gorang.shopping.model.vo.OrderPdopt;
import com.kh.gorang.shopping.service.OrderService;



@Controller
public class TimMyPageController {
	
	
	@Autowired
	private OrderService orderService; 
	
	@Autowired
	private MyPageService myPageService; 
	
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
	
	//마이페이지 나의냉장고
	@RequestMapping("myRefrigerator.me")
	public String myRefrigerator(HttpSession session, Model model){
		Member m = (Member)session.getAttribute("loginUser");
		
		int userNo = m.getMemberNo();
		
		// 페이지네이션 
		int refriIngreCount = myPageService.selectRefriCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(refriIngreCount, 1, 10, 5);
		
		List<RefrigeratorInsertDTO> refriIngres = myPageService.selectListRefrigeratorsByMemberNo(userNo, pi);
		
		// 현재 날짜 계산
		LocalDate currentDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		// 각 DTO에 날짜 차이를 계산하여 추가
	    for (RefrigeratorInsertDTO dto : refriIngres) {
	        LocalDate consumptionDate = LocalDate.parse(dto.getRefConsumptionDate(), formatter);
	        long daysDifference = ChronoUnit.DAYS.between(currentDate, consumptionDate);
	        dto.setDaysDifference(daysDifference);
	    }
		
		model.addAttribute("refriIngres", refriIngres);
		model.addAttribute("pi", pi);
				
		return "member/myRefrigerator";
	}
	
	@ResponseBody
	@RequestMapping("selectRefriAjax.me")
	public Map<String, Object> getRefriInfoByAjax(@RequestParam int cpage, HttpSession session) {
		System.out.println(cpage);
		
		Map<String, Object> result = new HashMap<>();
		
		Member m = (Member)session.getAttribute("loginUser");
		
		int userNo = m.getMemberNo();
		
		// 페이지네이션 
		int refriIngreCount = myPageService.selectRefriCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(refriIngreCount, cpage, 10, 5);
		
		List<RefrigeratorInsertDTO> refriIngres = myPageService.selectListRefrigeratorsByMemberNo(userNo, pi);
		
		// 현재 날짜 계산
		LocalDate currentDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		// 각 DTO에 날짜 차이를 계산하여 추가
	    for (RefrigeratorInsertDTO dto : refriIngres) {
	        LocalDate consumptionDate = LocalDate.parse(dto.getRefConsumptionDate(), formatter);
	        long daysDifference = ChronoUnit.DAYS.between(currentDate, consumptionDate);
	        dto.setDaysDifference(daysDifference);
	    }
		
		result.put("refriIngres", refriIngres);
		result.put("pi", pi);
		
		return result;
	}
	
	
	
	// 나의 냉장고 식재료 추가하기
	@ResponseBody
	@RequestMapping(value="insertRefri.me", produces="application/json; charset=UTF-8")
	public String insertIngredient(@RequestBody String ingreData, HttpSession session ) {
				
		Gson gson = new Gson();
		
		Type ingreDataType = new TypeToken<List<RefrigeratorInsertDTO>>(){}.getType();
		
		List<RefrigeratorInsertDTO> refriIngres = gson.fromJson(ingreData, ingreDataType);
		
		Member m = (Member)session.getAttribute("loginUser");
		
		return new Gson().toJson(myPageService.insertRefrigerator(m.getMemberNo(), refriIngres) > 0 ? "success" : "fail");
	}
}
	
