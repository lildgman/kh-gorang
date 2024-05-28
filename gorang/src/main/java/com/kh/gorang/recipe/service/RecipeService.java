package com.kh.gorang.recipe.service;

import java.util.ArrayList;

import com.kh.gorang.recipe.model.vo.Recipe;
import com.kh.gorang.recipe.model.vo.CookOrder;
import com.kh.gorang.recipe.model.vo.CookTip;
import com.kh.gorang.recipe.model.vo.Division;
import com.kh.gorang.recipe.model.vo.IngredientsInfo;

public interface RecipeService {
	int insertRecipe(Recipe rcp);

	int insertRcpDiv(ArrayList<Division> rcpDivList);

	int insertIngreInfo(ArrayList<IngredientsInfo> igreInfoList);

	int insertckOrderList(ArrayList<CookOrder> ckOrderList);

	int insertckTipList(ArrayList<CookTip> ckTipList);
}
