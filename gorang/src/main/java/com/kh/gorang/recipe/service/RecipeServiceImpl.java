package com.kh.gorang.recipe.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public int insertRecipe(Recipe rcp) {
		return recipeDao.insertRecipe(sqlSession,rcp);
	}


	@Override
	@Transactional
	public int insertRecipeInsertDTO(Recipe rcp, RecipeInsertDTO recipeInsertDTO) {
		int result1 = recipeDao.insertRecipe(sqlSession,rcp);
		System.out.println(result1);
		if(result1 > 0) {		
			//바로 해당 레시피 번호를 가져옴
			 int rcpNo = recipeDao.selectLastRecipeNo(sqlSession);
			int result2 =recipeDao.insertRecipeInsertDTODivList(sqlSession,recipeInsertDTO.getRcpDivList(),rcpNo);	
			if(result2>1) {
				int result3 =recipeDao.insertRecipeInsertDTOIgreList(sqlSession,recipeInsertDTO.getIgreInfoList());				
			}
		}
		
		return result1;
	}


	
}
