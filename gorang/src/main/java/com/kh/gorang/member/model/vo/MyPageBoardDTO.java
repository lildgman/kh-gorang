package com.kh.gorang.member.model.vo;

import com.kh.gorang.board.model.vo.Board;

import lombok.Data;

@Data
public class MyPageBoardDTO {
	private final Board board;
	private final int commentCount;
	private final int likeCount;
}
