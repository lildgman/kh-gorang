package com.kh.gorang.board.model.vo;

import lombok.Data;

@Data
public class BoardSearchDTO {
	
	private Board board;
	private int reportCount;
	private String boardWriter;
}
