package com.kh.gorang.recipe.model.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@ToString
public class RecipeInsertDTO {

	List<Division> rcpDivList;
	List<IngredientsInfo> igreInfoList;
	
	public RecipeInsertDTO() {
		rcpDivList = new ArrayList<Division>();
		igreInfoList = new ArrayList<IngredientsInfo>();
	}
}
