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
public class QnA {
	private int qnaNo;
	private	String qnaContent;
	private Date qnaCreateDate;
	private int qnaType;
	private String qnaPhoto;
	private String status;
	private int refQnaNo;
	private int refRecipeNo;
	private int refProductNo;
	private int writerNo;
	private String writerNickname;
	private String writerProfile;
}
