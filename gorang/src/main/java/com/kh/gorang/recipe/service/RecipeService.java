package com.kh.gorang.recipe.service;

import java.util.ArrayList;

import com.kh.gorang.recipe.model.vo.Recipe;
import com.kh.gorang.recipe.model.vo.RecipeInsertDTO;
import com.kh.gorang.recipe.model.vo.CookOrder;
import com.kh.gorang.recipe.model.vo.CookTip;
import com.kh.gorang.recipe.model.vo.Division;
import com.kh.gorang.recipe.model.vo.IngredientsInfo;

public interface RecipeService {
	Recipe insertRecipe(Recipe rcp);

	int insertRecipeInsertDTO(Recipe rcp, RecipeInsertDTO recipeInsertDTO);


}
