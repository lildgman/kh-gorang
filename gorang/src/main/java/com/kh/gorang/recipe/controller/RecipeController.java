package com.kh.gorang.recipe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.gorang.common.template.SaveFileController;
import com.kh.gorang.member.model.vo.Member;
import com.kh.gorang.recipe.model.vo.Recipe;
import com.kh.gorang.recipe.model.vo.RecipeInsertDTO;
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
	
	@RequestMapping("insert.re")
	public String insertRecipe(Recipe rcp,RecipeInsertDTO recipeInsertDTO, MultipartFile[]  completeImages, HttpSession session, Model model){
//		SaveFileController sfc = new SaveFileController();
		
		int result =recipeService.insertRecipeInsertDTO(rcp, recipeInsertDTO);
		for (MultipartFile upfile : completeImages) {
	        if (!upfile.getOriginalFilename().equals("")) {
	            // 파일 저장 또는 처리 로직 추가
	        	String changeName = saveFile(upfile,session,"/recipe/recipefinal");
	        }
	    }
		if(true) {			
			return "recipe/recipeList";
		}
		else {
			model.addAttribute("errorMsg","게시글 작성 실패");
			return "recipe/write.re";
		}
	}


	
	

}



