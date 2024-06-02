package com.kh.gorang.manager.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.board.model.vo.BoardSearchDTO;
import com.kh.gorang.manager.model.dao.ManagerDao;

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
 
		ArrayList<BoardSearchDTO> resultList = managerDao.ajaxSearchBoard(sqlSession, searchBoardTitle);
		log.info("resultList={}",resultList);
		return null;
//		return managerDao.ajaxSearchBoard(sqlSession, searchBoardTitle);
	}

}
