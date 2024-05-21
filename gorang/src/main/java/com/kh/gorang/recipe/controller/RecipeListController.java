package com.kh.gorang.recipe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RecipeListController {
	@RequestMapping("list.re")
	public String recipeListPage(){
		return "recipe/recipeList";
	}
}
