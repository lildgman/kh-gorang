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
	// 상품, 레시피 구분하는 속성
	private int qnaType;
	// 질문, 답변 구분하는 속성
	private int qnaAnswerType;
	private String qnaPhoto;
	private String status;
	private int refQnaNo;
	private int refRecipeNo;
	private int refProductNo;
	private int refPdoptNo;
	private int writerNo;
	private String writerNickname;
	private String writerProfile;
	//답변글 저장하는 변수들
	private int answerNo;
	private String answerContent;
	private Date answerCreateDate;
}
