package com.kh.gorang.manager.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.gorang.board.model.vo.Board;
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
	
	// ajax 게시글 검색
	@Override
	public ArrayList<BoardSearchDTO> ajaxSearchBoard(String searchBoardTitle) {
 
		ArrayList<BoardSearchDTO> resultList = managerDao.ajaxSearchBoard(sqlSession, searchBoardTitle);
		
		for(BoardSearchDTO b : resultList) {
			int reportCount = managerDao.getReportCount(sqlSession, b.getBoard().getBoardNo());
			String boardWriter = managerDao.getBoardWriter(sqlSession, b.getBoard().getBoardNo());
			b.setReportCount(reportCount);
			b.setBoardWriter(boardWriter);
		}
		
		log.info("resultList={}", resultList);
		
		return resultList;
	}

	// ajax 회원 검색
	@Override
	public ArrayList<Member> ajaxSearchMember(String searchMember) {
		
		return managerDao.ajaxSearchMember(sqlSession, searchMember);
	}

	// ajax 회원 상태 변경
	@Override
	@Transactional
	public int ajaxUpdateMemberStatus(ArrayList<Integer> memberNoList) {
		
		int result = 0;
		
		for(Integer memberNo : memberNoList) {
			Member member = managerDao.selectMember(sqlSession, memberNo);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("memberNo", member.getMemberNo());
			map.put("memberStatus", member.getMemberStatus());
			
			result = managerDao.ajaxUpdateMemberStatus(sqlSession, map);
			
		}
		
		
		return result;
	}

	@Override
	@Transactional
	public int ajaxUpdateBoardStatus(ArrayList<Integer> boardNoList) {
		
		int result = 0;
		
		for(Integer boardNo : boardNoList) {
			
			String boardStatus = managerDao.selectBoard(sqlSession, boardNo);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("boardNo", boardNo);
			map.put("boardStatus", boardStatus);
			
			result = managerDao.ajaxUpdateBoardStatus(sqlSession, map);

		}
		
		return result;
	}

}
