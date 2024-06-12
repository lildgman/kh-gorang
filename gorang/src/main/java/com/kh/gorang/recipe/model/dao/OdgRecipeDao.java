package com.kh.gorang.recipe.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.recipe.model.vo.Recipe;
import com.kh.gorang.shopping.model.vo.Product;

@Repository
public class OdgRecipeDao {

	// 최근 레시피 조회
	public ArrayList<Recipe> getRecentRecipe(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("odgRecipeMapper.selectRecentRecipe");
	}

	// 상품 조회
	public ArrayList<Product> getProductList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("odgRecipeMapper.selectProduct");
	}

}
