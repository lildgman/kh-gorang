package com.kh.gorang.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class RecipeQnaDTO {
	private int qnaNo;
	private String qnaContent;
	private Date qnaCreateDate;
	private String status;
	private int recipeNo;
	private String recipeTitle;
	private String recipeMainImg;
	private Integer refQnaNo;
}
