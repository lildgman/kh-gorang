package com.kh.gorang.recipe.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.recipe.model.vo.Recipe;

@Repository
public class RecipeDao {

	public int insertRecipe(SqlSessionTemplate sqlSession, Recipe rcp) {
		return sqlSession.insert("recipeMapper.insertRecipe",rcp);
	}

}
