package com.kh.gorang.recipe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.gorang.recipe.model.vo.Recipe;
import com.kh.gorang.recipe.model.vo.RecipeDivision;
import com.kh.gorang.recipe.service.RecipeService;

@Controller
public class RecipeController {
	@Autowired
	private RecipeService recipeService;
	
	@RequestMapping("main.re")
	public String recipeMainPage(){
		return "recipe/recipeMain";
	}
	
	@RequestMapping("detail.re")
	public String recipDetailPage(){
		return "recipe/recipeDetail";
	}
	
	@RequestMapping("write.re")
	public String recipWritePage(){
		return "recipe/recipeWrite";
	}
	
	@RequestMapping("list.re")
	public String recipeListPage(){
		return "recipe/recipeList";
	}
	
	@RequestMapping("insert.bo")
	public String insertRecipe(Recipe rcp,RecipeDivision rcpDv ,MultipartFile upfile, HttpSession session, Model model){
		int result = recipeService.insertRecipe(rcp);
//		int result2 = recipeService
//		int result3 = 
		if(result>0) {			
			return "recipe/recipeList";
		}
		else {
			model.addAttribute("errorMsg","게시글 작성 실패");
			return "recipe/write.re";
		}
	}
}



