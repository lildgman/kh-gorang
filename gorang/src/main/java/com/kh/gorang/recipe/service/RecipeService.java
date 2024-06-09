package com.kh.gorang.recipe.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.kh.gorang.recipe.model.vo.Recipe;
import com.kh.gorang.recipe.model.vo.RecipeInsertDTO;

public interface RecipeService {
	Recipe insertRecipe(Recipe rcp);

	int insertRecipeInsertDTO(Recipe rcp, RecipeInsertDTO recipeInsertDTO, MultipartFile[] completeImages,HttpSession session);



}
