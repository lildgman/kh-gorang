package com.kh.gorang.manager.service;

import java.util.ArrayList;

import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.board.model.vo.BoardSearchDTO;

public interface ManagerService {

	// ajax 상품 검색
	ArrayList<BoardSearchDTO> ajaxSearchBoard(String searchBoardTitle);

}
