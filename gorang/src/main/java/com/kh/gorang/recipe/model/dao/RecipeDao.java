package com.kh.gorang.recipe.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.gorang.common.model.vo.Media;
import com.kh.gorang.recipe.model.vo.CookOrder;
import com.kh.gorang.recipe.model.vo.CookTip;
import com.kh.gorang.recipe.model.vo.Division;
import com.kh.gorang.recipe.model.vo.IngredientsInfo;
import com.kh.gorang.recipe.model.vo.Recipe;

@Repository
public class RecipeDao {
	
	//레시피 추가	
	public Recipe insertRecipe(SqlSessionTemplate sqlSession, Recipe rcp) { 
		return (Recipe)sqlSession.selectOne("recipeMapper.insertRecipe",rcp);
	}
	
	//재료 정보 분류 추가 및 분류 번호 찾기
	public Division insertDivision(SqlSessionTemplate sqlSession, Division div,int rcpNo) {
		div.setRecipeNo(rcpNo);
		return (Division)sqlSession.selectOne("recipeMapper.insertDivision",div);
	}
	//재료 정보 추가
	public int insertIngredientsInfo(SqlSessionTemplate sqlSession, IngredientsInfo ingre, int divNo) {
		ingre.setDivNo(divNo);
		System.out.println("Dao null확인:"+ingre+",  num:" + divNo);
		return sqlSession.insert("recipeMapper.insertIngredientsInfo",ingre);
	}
	//레시피 순서 추가 및 레시피번호 찾기
	public CookOrder insertCookOrder(SqlSessionTemplate sqlSession, CookOrder cookOrder, int rcpNo) {
		cookOrder.setRecipeNo(rcpNo);
		return (CookOrder)sqlSession.selectOne("recipeMapper.insertCookOrder",cookOrder);
	}
	//팁 추가
	public int insertCookTip(SqlSessionTemplate sqlSession, CookTip cTip, int cookOrderNum) {
		cTip.setCookOrdNo(cookOrderNum);
		return sqlSession.insert("recipeMapper.insertCookTip",cTip);
	}
	
	//완성 사진들 추가
	public int insertRecipeMedia(SqlSessionTemplate sqlSession,Media md, int rcpNo) {
		md.setRecipeNo(rcpNo);
		return sqlSession.insert("mediaMapper.insertRecipeMedia",md);
	}
	
	//레시피 찾기
	public Recipe selectRecipe(SqlSessionTemplate sqlSession, int rcpNo) {
		return sqlSession.selectOne("recipeMapper.selectRecipe",rcpNo);
	}
	
	//레시피 분류 찾기
	public List<Division> selectDivList(SqlSessionTemplate sqlSession, int rcpNo) {	
		return sqlSession.selectList("recipeMapper.selectDivList", rcpNo);
	}
	//레시피 재료 속성(분류) 찾기
	public List<IngredientsInfo> selectIngredientsInfoList(SqlSessionTemplate sqlSession, int divNo) {
		return sqlSession.selectList("recipeMapper.selectIngredientsInfoList", divNo);
	}

	
	//레시피 조리순서 찾기
	public List<CookOrder> selectCookOrderList(SqlSessionTemplate sqlSession, int rcpNo) {
		return sqlSession.selectList("recipeMapper.selectCookOrderList", rcpNo);
	}
	
	
	//레시피 완성사진 찾기
	public List<Media> selectCompleteFoodPhoto(SqlSessionTemplate sqlSession, int rcpNo) {
		return sqlSession.selectList("mediaMapper.selectCompleteFoodPhoto", rcpNo);
	}
	
	//레시피 팁 찾기
	public List<CookTip> selectCookTipList(SqlSessionTemplate sqlSession, int cookOrdNo) {
		return sqlSession.selectList("recipeMapper.selectCookTipList", cookOrdNo);
	}	
	
	//레시피 수정
	public int updateRecipe(SqlSessionTemplate sqlSession, Recipe rcp) {
		return sqlSession.update("recipeMapper.updateRecipe",rcp);
	}
	//분류 수정
	public int updateDivision(SqlSessionTemplate sqlSession, int divNo) {
		return sqlSession.update("recipeMapper.updateDivision",divNo);
	}
	
	//재료(분류) 수정
	public int updateIngredientsInfo(SqlSessionTemplate sqlSession, int ingreNo) {
		return sqlSession.update("recipeMapper.updateIngredientsInfo",ingreNo);
		
	}
	
	
	
	
	//분류 길이(개수)
	public int selectfindDivLen(SqlSessionTemplate sqlSession, int recipeNo) {
		return sqlSession.selectOne("recipeMapper.selectfindDivLen",recipeNo);
	}

	public int selectfindIngreLen(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int selectfindCoLen(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int selectfindCtLen(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int selectfindCpLen(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	



	



	


}
