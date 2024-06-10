package com.kh.gorang.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class LikeRecipe {
	private final int memberNo;
	private final int recipeNo;
	private final String status;
	private final Date LikeDate;
}
