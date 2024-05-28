package com.kh.gorang.recipe.model.dao;

import java.util.ArrayList;
import java.util.List;

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
	public int insertRecipe(SqlSessionTemplate sqlSession, Recipe rcp) {
		return sqlSession.insert("recipeMapper.insertRecipe",rcp);
	}
	
	//레시피 마지막 번호 찾기
	public int selectLastRecipeNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("recipeMapper.getLastInsertedRecipeId");
	}
	
	//Divsion추가
	public int insertRecipeInsertDTODivList(SqlSessionTemplate sqlSession, List<Division> rcpDivList) {
		 int check = 1;
		 for (Division division : rcpDivList) {
		    check *= sqlSession.insert("recipeMapper.insertRcpDiv", division);
		 }
		 return check;
	}
	
	//	IgreList 추가
	public int insertRecipeInsertDTOIgreList(SqlSessionTemplate sqlSession, List<IngredientsInfo> igreInfoList) {
		int check = 1;
		 for (IngredientsInfo division : igreInfoList) {
		    check *= sqlSession.insert("recipeMapper.insertIngreInfo", division);
		 }
		 return check;
	}

	

	


}
