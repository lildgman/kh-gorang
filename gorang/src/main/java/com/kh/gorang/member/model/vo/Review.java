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
	private int refPdOptNo;
	private int refMemberNo;
//	브라우저에 뿌리기 위해 필요한 속성
	private String writerNickname;
	private String writerProfile;
	private String refPdOptName;
	
	
	
}
