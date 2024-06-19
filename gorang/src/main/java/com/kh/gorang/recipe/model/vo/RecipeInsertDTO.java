package com.kh.gorang.recipe.model.vo;

import java.util.ArrayList;
import java.util.List;

import com.kh.gorang.common.model.vo.Media;
import com.kh.gorang.member.model.vo.QnA;
import com.kh.gorang.member.model.vo.Review;
import com.kh.gorang.shopping.model.vo.Product;

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
	List<QnA> qnaList;
	List<Product> productList;
	public RecipeInsertDTO() {
		rcpDivList = new ArrayList<Division>();
		cookOrderList = new ArrayList<CookOrder>();
		completeFoodPhoto = new ArrayList<Media>();
		rwList = new ArrayList<Review>();
		qnaList =new ArrayList<QnA>();
		productList= new ArrayList<Product>();
	}
}
