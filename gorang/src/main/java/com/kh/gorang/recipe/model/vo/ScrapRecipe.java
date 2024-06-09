package com.kh.gorang.recipe.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ScrapRecipe {
	private final int memberNo;
	private final int recipeNo;
	private final String status;
	private final Date scrapDate;
}
