package com.kh.gorang.manager.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.gorang.board.model.vo.BoardSearchDTO;
import com.kh.gorang.manager.model.dao.ManagerDao;
import com.kh.gorang.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class ManagerServiceImpl implements ManagerService{

	private final ManagerDao managerDao;
	private final SqlSessionTemplate sqlSession;
	
	// ajax 상품 검색
	@Override
	public ArrayList<BoardSearchDTO> ajaxSearchBoard(String searchBoardTitle) {
 
		return managerDao.ajaxSearchBoard(sqlSession, searchBoardTitle);
	}

	// ajax 회원 검색
	@Override
	public ArrayList<Member> ajaxSearchMember(String searchMember) {
		
		return managerDao.ajaxSearchMember(sqlSession, searchMember);
	}

	// ajax 회원 상태 변경
	@Override
	@Transactional
	public int ajaxUpdateMember(ArrayList<Integer> memberNoList) {
		
		int result = 0;
		
		for(Integer memberNo : memberNoList) {
			Member member = managerDao.selectMember(sqlSession, memberNo);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("memberNo", member.getMemberNo());
			map.put("memberStatus", member.getMemberStatus());
			
			result = managerDao.ajaxUpdateMemberStatus(sqlSession, map);
			
		}
		
//		return managerDao.ajaxUpdateMember(sqlSession, memberNoList);
		
		return result;
	}

}
