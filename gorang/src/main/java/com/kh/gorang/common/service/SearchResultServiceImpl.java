package com.kh.gorang.common.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.gorang.common.model.dao.SearchResultDao;
import com.kh.gorang.common.model.vo.SearchBoardDTO;
import com.kh.gorang.common.model.vo.SearchProductDTO;
import com.kh.gorang.common.model.vo.SearchRecipeDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class SearchResultServiceImpl implements SearchResultService{

	private final SearchResultDao searchResultDao;
	private final SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<SearchBoardDTO> getSearchBoard(String content) {
		return searchResultDao.getSearchBoard(sqlSession, content);
	}

	@Override
	public ArrayList<SearchProductDTO> getSearchProduct(String content) {
		return searchResultDao.getSearchProduct(sqlSession, content);
	}

	@Override
	public ArrayList<SearchRecipeDTO> getSearchRecipe(String content) {
		return searchResultDao.getSearchRecipe(sqlSession, content);
	}

}
