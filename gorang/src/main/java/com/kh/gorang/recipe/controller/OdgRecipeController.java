package com.kh.gorang.recipe.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.gorang.common.model.vo.PageInfo;
import com.kh.gorang.common.template.Pagination;
import com.kh.gorang.recipe.model.dto.RecipeListDto;
import com.kh.gorang.recipe.service.OdgRecipeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class OdgRecipeController {
	
	private final OdgRecipeService odgRecipeService;
	
	@GetMapping("list.re")
	public String recipeListPage(
			@RequestParam(defaultValue = "1") int cpage,
			@RequestParam(defaultValue = "all") String category,
			@RequestParam(defaultValue = "default") String sort,
			@RequestParam(defaultValue = "") String content,
			Model model){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category",category);
		map.put("sort",sort);
		map.put("content",content);
		
		int recipeCount = odgRecipeService.getRecipeCount(map);
		
		PageInfo pi = Pagination.getPageInfo(recipeCount, cpage, 10, 12);
		
		ArrayList<RecipeListDto> list = odgRecipeService.getRecipeList(pi, map);
		
		model.addAttribute("category", category);
		model.addAttribute("sort", sort);
		model.addAttribute("content", content);
		model.addAttribute("list", list);
		model.addAttribute("pi",pi);
		
		return "recipe/recipeList";
	}
}
