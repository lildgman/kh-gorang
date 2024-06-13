package com.kh.gorang.manager.service;

import java.util.ArrayList;

import com.kh.gorang.board.model.vo.BoardSearchDTO;
import com.kh.gorang.common.model.vo.PageInfo;
import com.kh.gorang.member.model.vo.Member;

public interface ManagerService {

	// ajax 상품 검색
	ArrayList<BoardSearchDTO> ajaxSearchBoard(PageInfo pi, String searchBoardTitle);

	// ajax 회원 검색
	ArrayList<Member> ajaxSearchMember(String searchMember);

	// ajax 회원 상태 변경
	int ajaxUpdateMemberStatus(ArrayList<Integer> memberNoList);

	// ajax 게시물 상태 변경
	int ajaxUpdateBoardStatus(ArrayList<Integer> boardNoList);

	// 검색한 게시글 개수
	int searchBoardCount(String searchBoardTitle);

}
