package com.kh.gorang.manager.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.gorang.board.model.vo.BoardSearchDTO;
import com.kh.gorang.common.model.vo.PageInfo;
import com.kh.gorang.common.template.Pagination;
import com.kh.gorang.manager.service.ManagerService;
import com.kh.gorang.member.model.vo.Member;
import com.kh.gorang.shopping.service.ODGProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ManagerController {
	
	private final ODGProductService odgProductService;
	private final ManagerService managerService;
	
	@RequestMapping("enrollproduct.ma")
	public String managerProductEnrollForm() {
		return "manager/enrollProductForm";
	}
	
	@RequestMapping("updateproduct.ma")
	public String managerProductUpdateForm(Model model) {
		
		// 상품 전체 개수
		int allProductQuantity = odgProductService.selectAllProductQuantity();
		// 판매중인 상품 개수
		int saleProductQuantity = odgProductService.selectSaleProductQuantity();
		// 일시품절인 상품 개수
		int shortageProductQuantity = odgProductService.selectShortageProductQuantity();
		// 판매정지된 상품 개수
		int suspendedProductQuantity = odgProductService.selectSuspendedProductQuantity();

		
		model.addAttribute("allProductQuantity", allProductQuantity);
		model.addAttribute("saleProductQuantity", saleProductQuantity);
		model.addAttribute("shortageProductQuantity", shortageProductQuantity);
		model.addAttribute("suspendedProductQuantity", suspendedProductQuantity);
		
		return "manager/updateProductForm";
	}
	
	@RequestMapping("boards.ma")
	public String managerBoardCheckForm() {
		return "manager/checkBoardForm";
	}
	
	@RequestMapping("members.ma")
	public String managerMemberForm() {
		return "manager/memberManagementForm";

	}
	
	@GetMapping("search-board.ma")
	@ResponseBody
	public Map<String, Object> ajaxSearchBoard(
			@RequestParam(defaultValue = "1") int cpage,
			String searchBoardTitle) {
		
		int searchBoardCount = managerService.searchBoardCount(searchBoardTitle);
		
		PageInfo pi = Pagination.getPageInfo(searchBoardCount, cpage, 10, 10);
		
		
		ArrayList<BoardSearchDTO> boardList = managerService.ajaxSearchBoard(pi, searchBoardTitle);
		
		Map<String, Object> map = new HashMap<>();
		map.put("boardList", boardList);
		map.put("pi", pi);
		
		return map;
	}
	
	@GetMapping("search-member.ma")
	@ResponseBody
	public ArrayList<Member> ajaxSearchMember(String searchMember) {
		
		ArrayList<Member> memberList = managerService.ajaxSearchMember(searchMember);
		return memberList;
	}
	
	@PostMapping("update-status.me")
	@ResponseBody
	public String ajaxUpdateMemberStatus(@RequestBody ArrayList<Integer> memberNoList) {
		
		int result = managerService.ajaxUpdateMemberStatus(memberNoList);
		
		if(result > 0) {
			return "done";
		} else {
			return "undone";
		}
		
	}
	
	@PostMapping("update-status.bo")
	@ResponseBody
	public String ajaxUpdateBoardStatus(@RequestBody ArrayList<Integer> boardNoList) {
		
		int result = managerService.ajaxUpdateBoardStatus(boardNoList);
		
		if(result > 0) {
			return "done";
		} else {
			return "undone";
		}
	}

}
