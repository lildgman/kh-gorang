package com.kh.gorang.board.model.vo;

import lombok.Data;

@Data
public class MyPageBoardDTO {
	private final Board board;
	private final int commentCount;
	private final int likeCount;
}
