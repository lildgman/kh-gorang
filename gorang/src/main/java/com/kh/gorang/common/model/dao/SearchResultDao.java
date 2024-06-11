package com.kh.gorang.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.common.model.vo.SearchBoardDTO;
import com.kh.gorang.common.model.vo.SearchProductDTO;
import com.kh.gorang.common.model.vo.SearchRecipeDTO;

@Repository
public class SearchResultDao {

	// 검색결과 게시글 조회
	public ArrayList<SearchBoardDTO> getSearchBoard(SqlSessionTemplate sqlSession, String content) {
		return (ArrayList)sqlSession.selectList("searchMapper.selectSearchBoard", content);
	}

	// 검색결과 상품 조회
	public ArrayList<SearchProductDTO> getSearchProduct(SqlSessionTemplate sqlSession, String content) {
		return (ArrayList)sqlSession.selectList("searchMapper.selectSearchProduct", content);
	}

	// 검색결과 레시피 조회
	public ArrayList<SearchRecipeDTO> getSearchRecipe(SqlSessionTemplate sqlSession, String content) {
		return (ArrayList)sqlSession.selectList("searchMapper.selectSearchRecipe", content);
	}

}
