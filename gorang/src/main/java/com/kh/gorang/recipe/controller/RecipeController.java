package com.kh.gorang.recipe.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.gorang.common.template.SaveFileController;
import com.kh.gorang.common.vo.Media;
import com.kh.gorang.member.model.vo.Member;
import com.kh.gorang.recipe.model.vo.IngredientsInfo;
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
	public String insertRecipe(Recipe rcp, RecipeInsertDTO recipeInsertDTO ,HttpSession session, Model model){
		System.out.println("\n Recipe:" +  rcp +"\n");
		System.out.println("\n"+recipeInsertDTO+"\n");
		
		
		
		int result =recipeService.insertRecipeInsertDTO(rcp, recipeInsertDTO, session);
		if(result>0) {			
			return "recipe/recipeList";
		}
		else {
			model.addAttribute("errorMsg","게시글 작성 실패");
			return "recipe/write.re";
		}
	}
	
	//레시피 작성 썸네일(이미지)
	@PostMapping("upload")
	@ResponseBody
	public String upload(MultipartFile recipeMainPhoto, HttpSession session) {
		System.out.println("recipeMainPhoto: "+recipeMainPhoto.getOriginalFilename());
		String changeName = SaveFileController.saveFile(recipeMainPhoto, session,"/recipe/recipemain/");		
		return new Gson().toJson(changeName);
	}
	//레시피 작성 레시피 순서(이미지)
	@PostMapping("upload2")
	@ResponseBody
	public String upload2(MultipartFile cookOrdPhoto, HttpSession session) {
		System.out.println("cookOrdPhoto: "+cookOrdPhoto.getOriginalFilename());
		String changeName = SaveFileController.saveFile(cookOrdPhoto, session,"/recipe/recipeorder/");
		return new Gson().toJson(changeName);
	}	
	//레시피 작성 레시피 순서(완성사진)
	@PostMapping("upload3")
	@ResponseBody
	public String upload3(MultipartFile completeFoodPhoto, HttpSession session) {
		System.out.println("completeFoodPhoto: "+completeFoodPhoto.getOriginalFilename());
		String changeName = SaveFileController.saveFile(completeFoodPhoto, session,"/recipe/recipefinal/");
		return new Gson().toJson(changeName);
	}
	
	
	//레시피 수정창으로 이동
	@RequestMapping("updateForm.re")
	public String updateFormRecipe(@RequestParam("recipeNo") int recipeNo,Model model) {
		Recipe rcp = recipeService.selectRecipe(recipeNo);
		
		RecipeInsertDTO recipeInsertDTO = new RecipeInsertDTO();
		recipeInsertDTO.setRcpDivList(recipeService.selectDivList(recipeNo));
		recipeInsertDTO.setCookOrderList(recipeService.selectCookOrderList(recipeNo));
		recipeInsertDTO.setCompleteFoodPhoto(recipeService.selectCompleteFoodPhotoList(recipeNo));
		
		model.addAttribute("rcp",rcp);
		model.addAttribute("recipeInsertDTO",recipeInsertDTO);
		
		return "recipe/recipeUpdate";
	}
	
	
	//레시피 수정
	@RequestMapping("update.re")
	public String updateRecipe(Recipe rcp, RecipeInsertDTO recipeInsertDTO ,HttpSession session, Model model){
		System.out.println(recipeInsertDTO);
		
//		int result =recipeService.updateRecipeInsertDTO(rcp, recipeInsertDTO, session);
		if(true) {			
			return "recipe/recipeList";
		}
		else {
			model.addAttribute("errorMsg","게시글 작성 실패");
			return "recipe/write.re";
		}
	}
	
	//레시피 분류삭제
	@PostMapping("deleteDivision.re")
	@ResponseBody
	public int deleteDivision(MultipartFile completeFoodPhoto, HttpSession session) {
		int result;
		return 1;
	}
	
	//레시피 재료 행 삭제
	@PostMapping("deleteIngre.re")
	@ResponseBody
	public int deleteIngre(IngredientsInfo ingredientsInfo, HttpSession session) {
		System.out.println(ingredientsInfo);
		int result =1;
		return result;
	}
	
}


