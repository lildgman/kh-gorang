package com.kh.gorang.member.service;

import java.util.List;

import com.kh.gorang.member.model.vo.Member;
import com.kh.gorang.member.model.vo.ProductCart;

public interface MemberService {
	//로그인서비스
	Member loginMember(Member m);
	
	//id check를 위한 서비스
	int idCheck(String checkId);
	
	// nickname check
	int nameCheck(String checkName);
	
	//회원가입
	int insertMember(Member m);

	Member selectMemberByEmail(String email);
	
	// 장바구니 저장
	int insertProductCart(int memberNo, List<ProductCart> pdCarts);
	
	
}
