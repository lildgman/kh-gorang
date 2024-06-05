package com.kh.gorang.recipe.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.recipe.model.vo.Recipe;
import com.kh.gorang.recipe.model.vo.RecipeInsertDTO;
import com.kh.gorang.recipe.model.vo.CookOrder;
import com.kh.gorang.recipe.model.vo.CookTip;
import com.kh.gorang.recipe.model.vo.Division;
import com.kh.gorang.recipe.model.vo.IngredientsInfo;

@Repository
public class RecipeDao {
	
	//레시피 추가	
	public Recipe insertRecipe(SqlSessionTemplate sqlSession, Recipe rcp) { 
		return (Recipe)sqlSession.selectOne("recipeMapper.insertRecipe",rcp);
	}
	
	//재료 정보 분류 추가 및 분류 번호 찾기
	public Division insertDivision(SqlSessionTemplate sqlSession, Division div,int rcpNo) {
		div.setRecipeNo(rcpNo);
		return (Division)sqlSession.selectOne("recipeMapper.insertDivision",div);
	}
	//재료 정보 추가
	public int insertIngredientsInfo(SqlSessionTemplate sqlSession, IngredientsInfo ingre, int divNo) {
		ingre.setDivNo(divNo);
		System.out.println("Dao null확인:"+ingre+",  num:" + divNo);
		return sqlSession.insert("recipeMapper.insertIngredientsInfo",ingre);
	}
	//레시피 순서 추가 및 레시피번호 찾기
	public CookOrder insertCookOrder(SqlSessionTemplate sqlSession, CookOrder cookOrder, int rcpNo) {
		cookOrder.setRecipeNo(rcpNo);
		return (CookOrder)sqlSession.selectOne("recipeMapper.insertCookOrder",cookOrder);
	}
	//팁 추가
	public int insertCookTip(SqlSessionTemplate sqlSession, CookTip cTip, int cookOrderNum) {
		cTip.setCookOrdNo(cookOrderNum);
		return sqlSession.insert("recipeMapper.insertCookTip",cTip);
	}

	



	


}
