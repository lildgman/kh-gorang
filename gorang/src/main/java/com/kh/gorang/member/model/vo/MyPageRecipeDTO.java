package com.kh.gorang.member.model.vo;

import java.util.ArrayList;

import com.kh.gorang.recipe.model.vo.Recipe;

import lombok.Data;

@Data
public class MyPageRecipeDTO {
		
	private final Recipe recipe;
	private final int reviewCount;
	private final int likeCount;
	

}

