package com.kh.gorang.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardSearchDTO {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardThumbnail;
	private Date boardCreateDate;
	private int boardViews;
	private String boardTag;
	private int boardVote;
	private char status;
	private int memberNo;
	private int reportCount;
}
