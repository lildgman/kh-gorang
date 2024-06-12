package com.kh.gorang.common.service;

import java.util.ArrayList;

import com.kh.gorang.common.model.vo.SearchBoardDTO;
import com.kh.gorang.common.model.vo.SearchProductDTO;
import com.kh.gorang.common.model.vo.SearchRecipeDTO;

public interface SearchResultService {

	// 검색결과 게시글
	ArrayList<SearchBoardDTO> getSearchBoard(String content);

	// 검색결과 상품
	ArrayList<SearchProductDTO> getSearchProduct(String content);

	// 검색결과 레시피
	ArrayList<SearchRecipeDTO> getSearchRecipe(String content);

}
