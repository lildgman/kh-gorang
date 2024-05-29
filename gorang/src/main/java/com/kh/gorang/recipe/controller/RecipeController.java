package com.kh.gorang.recipe.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.gorang.recipe.model.vo.CookOrder;
import com.kh.gorang.recipe.model.vo.CookTip;
import com.kh.gorang.recipe.model.vo.IngredientsInfo;
import com.kh.gorang.recipe.model.vo.Recipe;
import com.kh.gorang.recipe.model.vo.RecipeInsertDTO;
import com.kh.gorang.recipe.model.vo.Division;
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
	public String insertRecipe(
			Recipe rcp,
			RecipeInsertDTO recipeInsertDTO,
			MultipartFile upfile, HttpSession session, Model model){

			System.out.println("1."+rcp);
			System.out.println("2."+recipeInsertDTO.getRcpDivList());
			System.out.println("3."+recipeInsertDTO.getIgreInfoList());
			int result =recipeService.insertRecipeInsertDTO(rcp, recipeInsertDTO);

		if(true) {			
			return "recipe/recipeList";
		}
		else {
			model.addAttribute("errorMsg","게시글 작성 실패");
			return "recipe/write.re";
		}
	}
	
	

}



