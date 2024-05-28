package com.kh.gorang.recipe.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gorang.recipe.model.dao.RecipeDao;
import com.kh.gorang.recipe.model.vo.Recipe;
import com.kh.gorang.recipe.model.vo.RecipeInsertDTO;
import com.kh.gorang.recipe.model.vo.CookOrder;
import com.kh.gorang.recipe.model.vo.CookTip;
import com.kh.gorang.recipe.model.vo.Division;
import com.kh.gorang.recipe.model.vo.IngredientsInfo;

@Service
public class RecipeServiceImpl implements RecipeService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private RecipeDao recipeDao;
	
	@Override
	public int insertRecipe(Recipe rcp) {
		return recipeDao.insertRecipe(sqlSession,rcp);
	}


	@Override
	public int insertRecipeInsertDTO(Recipe rcp, RecipeInsertDTO recipeInsertDTO) {
		int result1 = recipeDao.insertRecipe(sqlSession,rcp);
		if(result1>0) {		
			//바로 해당 레시피 번호를 가져옴
			 int recipeNo = recipeDao.selectLastRecipeNo(sqlSession);
			int result2 =recipeDao.insertRecipeInsertDTODivList(sqlSession,recipeInsertDTO.getRcpDivList());	
			if(result2>1) {
				int result3 =recipeDao.insertRecipeInsertDTOIgreList(sqlSession,recipeInsertDTO.getIgreInfoList());				
			}
		}
		
		return result1;
	}


	
}
