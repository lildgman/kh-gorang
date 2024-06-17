package com.kh.gorang.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class LikeBoard {
	private int boardNo;
	private int memberNo;
	private String status;
	private Date likeDate;
}
