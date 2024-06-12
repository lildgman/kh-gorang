package com.kh.gorang.recipe.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.gorang.recipe.model.dao.OdgRecipeDao;
import com.kh.gorang.recipe.model.vo.Recipe;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class OdgRecipeServiceImpl implements OdgRecipeService{

	private final OdgRecipeDao odgRecipeDao;
	private final SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Recipe> getRecentRecipe() {
		return odgRecipeDao.getRecentRecipe(sqlSession);
	}

}
