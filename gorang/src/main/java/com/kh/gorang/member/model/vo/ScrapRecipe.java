package com.kh.gorang.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@ToString
public class ScrapRecipe {
	private final int memberNo;
	private final int recipeNo;
	private final String status;
	private final Date scrapDate;
}
