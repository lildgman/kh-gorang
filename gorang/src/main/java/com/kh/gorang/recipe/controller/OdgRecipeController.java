package com.kh.gorang.recipe.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.gorang.recipe.model.vo.Recipe;
import com.kh.gorang.recipe.service.OdgRecipeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class OdgRecipeController {
	
	private final OdgRecipeService odgRecipeService;
	
	@GetMapping("main.re")
	public String recipeMainPage(
			Model model){
		
		ArrayList<Recipe> recentRecipeList = odgRecipeService.getRecentRecipe();
		
		return "recipe/recipeMain";
	}
}
