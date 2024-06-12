package com.kh.gorang.recipe.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.recipe.model.vo.Recipe;

@Repository
public class OdgRecipeDao {

	public ArrayList<Recipe> getRecentRecipe(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("odgRecipeMapper.selectRecentRecipe");
	}

}
