package com.kh.gorang.recipe.model.vo;

import lombok.Data;

@Data
public class MyPageRecipeDTO {
		
	private final Recipe recipe;
	private final int reviewCount;
	private final int likeCount;
	

}

