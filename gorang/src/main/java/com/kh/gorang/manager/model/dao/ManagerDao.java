package com.kh.gorang.manager.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.board.model.vo.BoardSearchDTO;
import com.kh.gorang.member.model.vo.Member;

@Repository
public class ManagerDao {

	// ajax 게시글 조회
	public ArrayList<BoardSearchDTO> ajaxSearchBoard(SqlSessionTemplate sqlSession, String searchBoardTitle) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("managerMapper.ajaxSearchBoard", searchBoardTitle);
	}
	
	// ajax 회원 조회
	public ArrayList<Member> ajaxSearchMember(SqlSessionTemplate sqlSession, String searchMember) {
		return (ArrayList)sqlSession.selectList("managerMapper.ajaxSearchMember", searchMember);
	}

	// 회원번호로 회원 조회
	public Member selectMember(SqlSessionTemplate sqlSession, Integer memberNo) {
		return sqlSession.selectOne("managerMapper.selectMember", memberNo);
	}

	// 회원 상태 변경
	public int ajaxUpdateMemberStatus(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("managerMapper.ajaxUpdateMemberStatus", map);
	}

	// 게시글 누적 신고수 조회
	public int getReportCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("managerMapper.selectReportCount", boardNo);
	}

	// 게시글 작성자 조회
	public String getBoardWriter(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("managerMapper.selectBoardWriter", boardNo);
	}

	// 게시글 번호로 게시글 상태 조회
	public String selectBoard(SqlSessionTemplate sqlSession, Integer boardNo) {
		return sqlSession.selectOne("managerMapper.selectBoard", boardNo);
	}
	
	// 게시글 상태 변경
	public int ajaxUpdateBoardStatus(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("managerMapper.ajaxUpdateBoardStatus", map);
	}

	

	
}
