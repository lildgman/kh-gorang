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
public class CookTip {
	private int cookTipNo;
	private String cookTipContent;
	private char status;
	private int cookOrdNo;
	
	private String updateCtStatus;
}
