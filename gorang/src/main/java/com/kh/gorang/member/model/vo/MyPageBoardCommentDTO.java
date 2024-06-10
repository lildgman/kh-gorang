package com.kh.gorang.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MyPageBoardCommentDTO {

	private final int commentNo;
	private final String commentContent;
	private final String boardThumbnail;
	private final Date commentDate;
	private final String status;
	private final int boardNo;
	private final int memberNo;
}
