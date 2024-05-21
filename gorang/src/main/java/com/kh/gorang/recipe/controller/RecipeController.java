package com.kh.gorang.recipe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RecipeController {
	@RequestMapping("main.re")
	public String recipeMainPage(){
		return "recipe/recipeMain";
	}
	
	
	@RequestMapping("recipeDetail.re")
	public String recipDetailPage(){
		return "recipe/recipeDetail";
	}
}



