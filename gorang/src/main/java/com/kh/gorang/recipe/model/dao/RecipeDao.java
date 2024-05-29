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
	public int insertRecipe(SqlSessionTemplate sqlSession, Recipe rcp) {
		Recipe rcp2 = new Recipe(0, "솔티드 딸바 크레페","크레이프케이크에 환상적인 카라멜과의 조합으로 달콤한 디저트 시간을 보내요!" ,null, "gorang/resources/dummyImg/recipe/레시피1/recipeBoardImg(1).jpg", "#크레이프#카라멜#솔티드#케이크",null,"3인분","15분이내","디저트","하",'Y',11);
		System.out.println("rcp2 :" + rcp2);
		int key = sqlSession.insert("recipeMapper.insertRecipe",rcp2); 
		System.out.println("key :" + key);
		return key;
	}
	
	//레시피 마지막 번호 찾기(방금 작성한 해당 레시피 게시글 번호)
	public int selectLastRecipeNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("recipeMapper.getLastInsertedRecipeId");
	}
	
	//Divsion추가
	public int insertRecipeInsertDTODivList(SqlSessionTemplate sqlSession, List<Division> rcpDivList, int rcpNo) {
		 int check = 1;
		 for (Division division : rcpDivList) {
			 Map<String, Object> parameters = new HashMap<>();
		        parameters.put("division", division.getDivName());
		        parameters.put("rcpNo", rcpNo);
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
