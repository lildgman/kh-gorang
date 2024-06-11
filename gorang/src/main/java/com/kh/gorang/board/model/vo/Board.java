package com.kh.gorang.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Board {
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
	private String memberNickname;
}