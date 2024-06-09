package com.kh.gorang.recipe.model.vo;

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
public class IngredientsInfo {
	private int ingreNo;
	private String ingreName;
	private int ingreAmount;
	private String ingreUnit;
	private char status;
	private int divNo;
}
