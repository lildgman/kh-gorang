package com.kh.gorang.recipe.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.gorang.common.model.vo.PageInfo;
import com.kh.gorang.recipe.model.dto.RecipeListDto;
import com.kh.gorang.shopping.model.vo.Product;

public interface OdgRecipeService {
	

	int getRecipeCount(Map<String, Object> map);

	
	ArrayList<RecipeListDto> getRecipeList(PageInfo pi, Map<String, Object> map);
}
