package com.kh.gorang.manager.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.board.model.vo.BoardSearchDTO;

@Repository
public class ManagerDao {

	public ArrayList<BoardSearchDTO> ajaxSearchBoard(SqlSessionTemplate sqlSession, String searchBoardTitle) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("managerMapper.ajaxSearchBoard", searchBoardTitle);
	}

}
