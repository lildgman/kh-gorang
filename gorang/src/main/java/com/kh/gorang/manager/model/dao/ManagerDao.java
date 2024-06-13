package com.kh.gorang.manager.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.board.model.vo.BoardSearchDTO;
import com.kh.gorang.common.model.vo.PageInfo;
import com.kh.gorang.member.model.vo.Member;

@Repository
public class ManagerDao {

	// ajax 게시글 조회
	public ArrayList<BoardSearchDTO> ajaxSearchBoard(SqlSessionTemplate sqlSession, PageInfo pi, String searchBoardTitle) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("managerMapper.ajaxSearchBoard", searchBoardTitle, rowBounds);
	}
	
	// ajax 회원 조회
	public ArrayList<Member> ajaxSearchMember(SqlSessionTemplate sqlSession, PageInfo pi, String searchMember) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("managerMapper.ajaxSearchMember", searchMember, rowBounds);
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

	// 검색한 게시글 개수 조회
	public int searchBoardCount(SqlSessionTemplate sqlSession, String searchBoardTitle) {
		return sqlSession.selectOne("managerMapper.selectBoardCount",searchBoardTitle);
	}

	// 검색한 회원 결과 개수
	public int searchMemberCount(SqlSessionTemplate sqlSession, String searchMember) {
		return sqlSession.selectOne("managerMapper.selectMemberCount", searchMember);
	}
	
	

	

	
}
