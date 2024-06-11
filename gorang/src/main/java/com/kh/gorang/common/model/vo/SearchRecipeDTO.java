package com.kh.gorang.common.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SearchRecipeDTO {
	
	private int recipeNo;
	private String recipeImg;
	private String recipeTitle;
	private String recipeWriter;
	private String recipeWriterProfileImg;
	private int scrapCount;
}
