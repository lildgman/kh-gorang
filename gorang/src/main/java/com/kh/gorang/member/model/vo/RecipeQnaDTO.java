package com.kh.gorang.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class RecipeQnaDTO {
	private final String qnaContent;
	private final Date qnaCreateDate;
	private final String status;
	private final int recipeNo;
	private final String recipeTitle;
	private final String recipeMainImg;
	private final Integer refQnaNo;
}
