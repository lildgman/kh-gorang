package com.kh.gorang.recipe.model.vo;

import java.util.ArrayList;
import java.util.List;

import com.kh.gorang.common.model.vo.Media;

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
	List<CookOrder> cookOrderList;
	List<Media> completeFoodPhoto;
	public RecipeInsertDTO() {
		rcpDivList = new ArrayList<Division>();
		cookOrderList = new ArrayList<CookOrder>();
		completeFoodPhoto = new ArrayList<Media>();
	}
}
