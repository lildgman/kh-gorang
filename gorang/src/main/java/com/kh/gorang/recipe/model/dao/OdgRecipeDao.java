package com.kh.gorang.recipe.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.common.model.vo.PageInfo;
import com.kh.gorang.recipe.model.dto.RecipeListDto;

@Repository
public class OdgRecipeDao {
	
	// 레시피 개수 조회
	public int getRecipeCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectOne("odgRecipeMapper.selectRecipeCount",map);
	}
	
	// 레시피 조회
	public ArrayList<RecipeListDto> getRecipeList(SqlSessionTemplate sqlSession, PageInfo pi, Map<String, Object> map) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("odgRecipeMapper.selectRecipe", map, rowBounds);
	}

}
