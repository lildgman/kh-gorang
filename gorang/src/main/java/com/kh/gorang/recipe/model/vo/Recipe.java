package com.kh.gorang.recipe.model.vo;

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
public class Recipe {
	private int recipeNo;
	private String recipeTitle;
	private String recipeContent;
	private String recipeVideo;
	private String recipeMainPhoto;
	private String recipeTag;
	private Date recipeWriteDate;
	private String cookAmount;
	private String cookTime;
	private String cookKind;
	private String cookLevel;
	private int recipeView;
	private char status;
	private int memberNo;

}
