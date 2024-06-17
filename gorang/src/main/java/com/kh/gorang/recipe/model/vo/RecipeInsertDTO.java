package com.kh.gorang.recipe.model.vo;

import java.util.ArrayList;
import java.util.List;

import com.kh.gorang.common.model.vo.Media;
import com.kh.gorang.member.model.vo.Review;

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
	List<Review> rwList;
	public RecipeInsertDTO() {
		rcpDivList = new ArrayList<Division>();
		cookOrderList = new ArrayList<CookOrder>();
		completeFoodPhoto = new ArrayList<Media>();
		rwList = new ArrayList<Review>();
	}
}
