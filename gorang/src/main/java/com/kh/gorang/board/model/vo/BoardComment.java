package com.kh.gorang.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardComment {

	private final int commentNo;
	private final String commentContent;
	private final Date commentDate;
	private final String status;
	private final int boardNo;
	private final int memberNo;
}
