package com.kh.gorang.member.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MyPageReviewDTO {
	private int reviewNo;
	private String reviewContent;
	private Date reviewCreateDate;
	private int reviewType;
	private int refContentNo;
	private String contentImg;
}
