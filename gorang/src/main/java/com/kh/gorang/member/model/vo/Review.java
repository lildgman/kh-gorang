package com.kh.gorang.member.model.vo;

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
public class Review {
	private int reviewNo;
	private String reviewContent;
	private Date reviewCreateDate;
	private int rating;
	private String reviewPhoto;
	private int reviewType;
	private String status;
	private int refRecipeNo;
	private int refProductNo;
	private int refMemberNo;
}
