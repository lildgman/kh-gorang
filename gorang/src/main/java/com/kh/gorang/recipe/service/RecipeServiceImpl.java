package com.kh.gorang.recipe.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gorang.recipe.model.dao.RecipeDao;
import com.kh.gorang.recipe.model.vo.Recipe;
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
	public int insertRcpDiv(ArrayList<Division> rcpDivList) {
		return recipeDao.insertRcpDiv(sqlSession, rcpDivList);
	}

	@Override
	public int insertIngreInfo(ArrayList<IngredientsInfo> igreInfoList) {
		return recipeDao.insertIngreInfo(sqlSession, igreInfoList);
	}

	@Override
	public int insertckOrderList(ArrayList<CookOrder> ckOrderList) {

		return recipeDao.insertckOrderList(sqlSession, ckOrderList);
	}

	@Override
	public int insertckTipList(ArrayList<CookTip> ckTipList) {

		return recipeDao.insertckTipList(sqlSession, ckTipList);
	}
	
}
