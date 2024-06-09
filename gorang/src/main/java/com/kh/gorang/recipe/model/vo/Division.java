package com.kh.gorang.recipe.model.vo;

import java.util.List;

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
public class Division {
	private int divNo;
	private String divName;
	private char status;
	private int recipeNo;
	private List<IngredientsInfo> ingredientsInfoList;

}
