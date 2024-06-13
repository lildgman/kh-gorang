package com.kh.gorang.manager.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.gorang.board.model.vo.BoardSearchDTO;
import com.kh.gorang.common.model.vo.PageInfo;
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
	@Transactional
	public ArrayList<BoardSearchDTO> ajaxSearchBoard(PageInfo pi, String searchBoardTitle) {
 
		ArrayList<BoardSearchDTO> resultList = managerDao.ajaxSearchBoard(sqlSession, pi, searchBoardTitle);
		
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
	public ArrayList<Member> ajaxSearchMember(PageInfo pi, String searchMember) {
		
		return managerDao.ajaxSearchMember(sqlSession, pi, searchMember);
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

	// 검색한 상품 개수 조회
	@Override
	public int searchBoardCount(String searchBoardTitle) {
		return managerDao.searchBoardCount(sqlSession, searchBoardTitle);
	}

	@Override
	public int getSearchMemberCount(String searchMember) {
		return managerDao.searchMemberCount(sqlSession, searchMember);
	}

}
