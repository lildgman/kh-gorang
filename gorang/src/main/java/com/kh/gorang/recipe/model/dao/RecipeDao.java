package com.kh.gorang.recipe.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.recipe.model.vo.Recipe;
import com.kh.gorang.recipe.model.vo.CookOrder;
import com.kh.gorang.recipe.model.vo.CookTip;
import com.kh.gorang.recipe.model.vo.Division;
import com.kh.gorang.recipe.model.vo.IngredientsInfo;

@Repository
public class RecipeDao {

	public int insertRecipe(SqlSessionTemplate sqlSession, Recipe rcp) {
		return sqlSession.insert("recipeMapper.insertRecipe",rcp);
	}

	public int insertRcpDiv(SqlSessionTemplate sqlSession, ArrayList<Division> rcpDivList) {
		return sqlSession.insert("recipeMapper.insertRcpDiv",rcpDivList);
	}

	public int insertIngreInfo(SqlSessionTemplate sqlSession, ArrayList<IngredientsInfo> igreInfoList) {
		// TODO Auto-generated method stub
		return sqlSession.insert("recipeMapper.insertIngreInfo",igreInfoList);
	}

	public int insertckOrderList(SqlSessionTemplate sqlSession, ArrayList<CookOrder> ckOrderList) {
		// TODO Auto-generated method stub
		return sqlSession.insert("recipeMapper.insertckOrderList",ckOrderList);
	}

	public int insertckTipList(SqlSessionTemplate sqlSession, ArrayList<CookTip> ckTipList) {
		// TODO Auto-generated method stub
		return sqlSession.insert("recipeMapper.insertckTipList",ckTipList);
	}

}
