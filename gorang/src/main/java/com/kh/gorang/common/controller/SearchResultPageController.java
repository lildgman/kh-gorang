package com.kh.gorang.common.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.gorang.common.model.vo.SearchBoardDTO;
import com.kh.gorang.common.model.vo.SearchProductDTO;
import com.kh.gorang.common.model.vo.SearchRecipeDTO;
import com.kh.gorang.common.service.SearchResultService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class SearchResultPageController {
	
	private final SearchResultService searchResultService;
	
	@GetMapping("search.re")
	public String  SearchResultPage(
			@RequestParam String content,
			Model model) {
		
		log.info("content={}", content);
		// 검색한 내용이 포함된 게시글 조회
		ArrayList<SearchBoardDTO> searchBoardResult = searchResultService.getSearchBoard(content);
		
		// 검색 내용이 포함된 상품 조회
		ArrayList<SearchProductDTO> searchProductResult = searchResultService.getSearchProduct(content);
		
		// 검색 내용이 포함된 레시피 조회
		ArrayList<SearchRecipeDTO> searchRecipeResult = searchResultService.getSearchRecipe(content);
		
		log.info("searchBoardResult={}",searchBoardResult);
		log.info("searchProductResult={}",searchProductResult);
		log.info("searchRecipeResult={}",searchRecipeResult);
		
		model.addAttribute("content", content);
		model.addAttribute("searchBoardResult", searchBoardResult);
		model.addAttribute("searchProductResult", searchProductResult);
		model.addAttribute("searchRecipeResult", searchRecipeResult);
		
		return "common/searchResultPage";
	}
}
