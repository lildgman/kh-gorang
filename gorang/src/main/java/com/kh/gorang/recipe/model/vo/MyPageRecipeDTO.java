package com.kh.gorang.recipe.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class MyPageRecipeDTO {
		
	private Recipe recipe;
	private int commentCount;
	private int likeCount;
	
	public MyPageRecipeDTO(Recipe recipe, int recipeCommentCount, int likeCount) {
		this.recipe = recipe;
		this.commentCount = recipeCommentCount;
		this.likeCount = likeCount;
	}
}

