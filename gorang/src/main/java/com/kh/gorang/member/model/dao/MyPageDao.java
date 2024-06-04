package com.kh.gorang.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.recipe.model.vo.Recipe;
import com.kh.gorang.shopping.model.vo.Product;

@Repository
public class MyPageDao {

	// 팔로잉 수 조회
	public int getFollowingCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectFollowingCount", memberNo);
	}

	// 팔로워 수 조회
	public int getFollowerCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectFollowerCount", memberNo);
	}

	// 게시글 스크랩 수 조회
	public int getBoardScrapCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectBoardScrapCount", memberNo);
	}

	// 상품 스크랩 수 조회
	public int getProductScrapCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectProductScrapCount", memberNo);
	}

	// 레시피 스크랩 수 조회
	public int getRecipeScrapCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectRecipeScrapCount", memberNo);
		
	}

	// 게시글 좋아요 수 조회
	public int getBoardLikeCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectBoardLikeCount", memberNo);
	}

	// 레시피 좋아요 수 조회
	public int getRecipeLikeCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectRecipeLikeCount", memberNo);
	}

	// 조회수가 많은 순으로 정렬된 레시피 리스트 조회
	public ArrayList<Recipe> getMostViewRecipeList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectMostViewRecipeList", memberNo);
	}

	// 조회수가 많은 순으로 정렬된 게시글 리스트 조회
	public ArrayList<Board> getMostViewBoardList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectMostViewBoardList", memberNo);
	}

	// 스크랩한 레시피들 조회수가 많은 순으로 정렬된 리스트 조회
	public ArrayList<Recipe> getMostViewScrapedRecipeList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectMostViewScrapedRecipeList",memberNo);
	}

	// 스크랩한 게시글들 조회수가 많은 순으로 정렬된 리스트로 조회
	public ArrayList<Board> getMostViewScrapedBoardList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectMostViewScrapedBoardList", memberNo);
	}

	// 스크랩한 상품들 조회수가 많은 순으로 정렬된 리스트로 조회
	public ArrayList<Product> getMostViewScrapedProductList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectMostViewScrapedProductList", memberNo);
	}

	// 좋아요 누른 레시피 조회
	public ArrayList<Recipe> getLikedRecipeList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectLikedRecipeList", memberNo);
	}

	// 좋아요 누른 게시글 조회
	public ArrayList<Board> getLikedBoardList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectLikedBoardList", memberNo);
	}

}
