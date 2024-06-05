package com.kh.gorang.board.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gorang.board.model.dao.BoardDao;
import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.common.vo.PageInfo;




@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public int selectListCount() {
		int count = boardDao.selectListCount(sqlSession);
		return count;
	}
	@Override
	public ArrayList<Board> selectList(PageInfo pi){
		return boardDao.selectList(sqlSession, pi);
	}
	
	@Override
	public Board selectBoard(int boardNo) {
		return boardDao.selectBoard(sqlSession, boardNo);
	}
	
	@Override
	public int insertBoard(Board board) {
		return boardDao.insertBoard(sqlSession,board);
	}
	@Override
    public void increaseViewCount(int boardNo) {
        boardDao.increaseViewCount(sqlSession, boardNo);
    }
}