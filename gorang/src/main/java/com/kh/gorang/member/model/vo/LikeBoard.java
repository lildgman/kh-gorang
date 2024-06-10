package com.kh.gorang.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class LikeBoard {
	private final int memberNo;
	private final int boardNo;
	private final String status;
	private final Date LikeDate;
}
