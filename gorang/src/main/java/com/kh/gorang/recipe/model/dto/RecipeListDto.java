package com.kh.gorang.recipe.model.dto;

import lombok.NoArgsConstructor;

import lombok.Data;

@Data
@NoArgsConstructor
public class RecipeListDto {
	private int recipeNo;
	private String recipeTitle;
	private String recipeImg;
	private String recipeWriterNickname;
	private String recipeWriterProfileImg;
	private int scrapCount;
}
