package com.kh.gorang.recipe.model.vo;

import java.sql.Date;
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
public class CookOrder {
	private int cookOrdNo;
	private String cookOrdContent;
	private String cookOrdPhoto;
	private char status;
	private int recipeNo;
	private List<CookTip> cookTip;
}
