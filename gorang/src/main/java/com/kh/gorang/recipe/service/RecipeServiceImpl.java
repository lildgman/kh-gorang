package com.kh.gorang.recipe.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.gorang.member.model.vo.Member;
import com.kh.gorang.recipe.model.dao.RecipeDao;
import com.kh.gorang.recipe.model.vo.Recipe;
import com.kh.gorang.recipe.model.vo.RecipeInsertDTO;

@Service
public class RecipeServiceImpl implements RecipeService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private RecipeDao recipeDao;
	
	@Override
	public Recipe insertRecipe(Recipe rcp) {
		return recipeDao.insertRecipe(sqlSession,rcp);
	}


	@Override
	@Transactional
	public int insertRecipeInsertDTO(Recipe rcp, RecipeInsertDTO recipeInsertDTO) {
		Recipe result1 = recipeDao.insertRecipe(sqlSession,rcp);
		System.out.println(result1);
		int rcpNo = result1.getRecipeNo();
		System.out.println(rcpNo);
//		int result2 =recipeDao.insertRecipeInsertDTODivList(sqlSession,recipeInsertDTO.getRcpDivList(),rcpNo);	
//		if(result2>1) {
//			int result3 =recipeDao.insertRecipeInsertDTOIgreList(sqlSession,recipeInsertDTO.getIgreInfoList());				
//		}
//		

		return 0;
	}


	
}
