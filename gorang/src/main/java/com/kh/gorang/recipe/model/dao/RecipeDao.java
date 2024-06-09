package com.kh.gorang.recipe.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.common.vo.Media;
import com.kh.gorang.recipe.model.vo.CookOrder;
import com.kh.gorang.recipe.model.vo.CookTip;
import com.kh.gorang.recipe.model.vo.Division;
import com.kh.gorang.recipe.model.vo.IngredientsInfo;
import com.kh.gorang.recipe.model.vo.Recipe;

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
	
	//완성 사진들 추가
	public int insertRecipeMedia(SqlSessionTemplate sqlSession,Media md, int rcpNo) {
		md.setRecipeNo(rcpNo);
		return sqlSession.insert("recipeMapper.insertRecipeMedia",md);
	}

	



	


}
