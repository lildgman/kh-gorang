package com.kh.gorang.board.service;

import java.util.ArrayList;

import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.common.vo.PageInfo;

public interface BoardService{
	//게시글 총 갯수 가져오기
	int selectListCount();
	
	//게시글 리스트 조회(게시글메인)
	ArrayList<Board>selectList(PageInfo pi);
	
	//게시글 리스트 조회(최신 순)
    ArrayList<Board> selectListByLatest(PageInfo pi);
    
	//게시글 리스트 조회(조회수 순)
	ArrayList<Board> selectListByViewCount(PageInfo pi);
	
	//게시글 리스트 조회(일상 태그)
	ArrayList<Board> selectListByTagDaily(PageInfo pi);
	//게시글 리스트 조회(질문 태그)
	ArrayList<Board> selectListByTagQuestion(PageInfo pi);
	//게시글 리스트 조회(노하우 태그)
	ArrayList<Board> selectListByTagKnowHow(PageInfo pi);
	//게시글 리스트 조회(꿀팁 태그)
	ArrayList<Board> selectListByTagTip(PageInfo pi);
	//게시글 리스트 조회(보관법 태그)
	ArrayList<Board> selectListByTagMethod(PageInfo pi);
		
	
	//상세 게시글 조회
	Board selectBoard(int boardNo);
	
	//게시글 추가
	int insertBoard(Board board);
	
	//게시글 조회수 증가
	void increaseViewCount(int boardNo);
	
}	