package com.kh.gorang.board.service;

import java.util.ArrayList;

import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.common.vo.PageInfo;

public interface BoardService{
	//게시글 총 갯수 가져오기
	int selectListCount();
	
	//게시글 리스트 조회(게시글메인)
	ArrayList<Board>selectList(PageInfo pi);
	
	//상세 게시글 조회
	Board selectBoard(int boardNo);
	
	//게시글 추가
	int insertBoard(Board board);
	
	
}	