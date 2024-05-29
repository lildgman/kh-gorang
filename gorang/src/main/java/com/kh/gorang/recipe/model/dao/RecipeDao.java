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
	

	
	//Divsion추가
	public int insertRecipeInsertDTODivList(SqlSessionTemplate sqlSession, List<Division> rcpDivList, int rcpNo) {
		 int check = 1;
		 for (Division division : rcpDivList) {
			 Map<String, Object> parameters = new HashMap<>();
		        parameters.put("division", division.getDivName());
		        parameters.put("rcp_no", rcpNo);
		    check *= sqlSession.insert("recipeMapper.insertRcpDiv",parameters);
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
