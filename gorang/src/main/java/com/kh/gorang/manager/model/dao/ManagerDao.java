package com.kh.gorang.manager.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.board.model.vo.Board;
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

	// ajax 회원 탈퇴
	public int ajaxDeleteMember(SqlSessionTemplate sqlSession, ArrayList<Integer> memberNoList) {
		return sqlSession.update("managerMapper.ajaxDeleteMember", memberNoList);
	}

}
