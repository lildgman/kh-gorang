package com.kh.gorang.member.service;

import com.kh.gorang.member.model.vo.Member;

public interface MemberService {
	//로그인서비스
	Member loginMember(Member m);
	
	//id check를 위한 서비스
	int idCheck(String checkId);
	
	//회원가입
	int insertMember(Member m);

}
