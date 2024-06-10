package com.kh.gorang.member.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.common.vo.PageInfo;
import com.kh.gorang.member.model.vo.MyPageBoardCommentDTO;
import com.kh.gorang.member.model.vo.MyPageLikeBoardDTO;
import com.kh.gorang.member.model.vo.MyPageLikeRecipeDTO;
import com.kh.gorang.member.model.vo.MyPageScrapBoardDTO;
import com.kh.gorang.member.model.vo.MyPageScrapProductDTO;
import com.kh.gorang.member.model.vo.MyPageScrapRecipeDTO;
import com.kh.gorang.member.model.vo.Review;
import com.kh.gorang.recipe.model.vo.Recipe;
import com.kh.gorang.shopping.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
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
	public int getTotalBoardLikeCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectTotalBoardLikeCount", memberNo);
	}

	// 레시피 좋아요 수 조회
	public int getTotalRecipeLikeCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectTotalRecipeLikeCount", memberNo);
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

	// 레시피 조회
	public ArrayList<Recipe> getRecipeList(SqlSessionTemplate sqlSession, PageInfo pi, Map<String, Object> map) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("myPageMapper.selectRecipeList", map, rowBounds);
	}

	// 나의 레시피 개수 조회
	public int getMyRecipeCount(SqlSessionTemplate sqlSession, int memberNo) {

		return sqlSession.selectOne("myPageMapper.selectMyRecipeCount", memberNo);
	}

	// 레시피 리뷰 개수 조회
	public int getRecipeReviewCount(SqlSessionTemplate sqlSession, int recipeNo) {
		return sqlSession.selectOne("myPageMapper.selectRecipeReviewCount", recipeNo);
	}

	// 레시피 좋아요 개수 조회
	public int getRecipeLikeCount(SqlSessionTemplate sqlSession, int recipeNo) {
		return sqlSession.selectOne("myPageMapper.selectRecipeLikeCount", recipeNo);
	}

	// 레시피 삭제 
	public int removeRecipe(SqlSessionTemplate sqlSession, int recipeNo) {
		return sqlSession.update("myPageMapper.removeRecipe", recipeNo);
	}

	// 게시글 개수 조회 
	public int getBoardCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectBoardCount", memberNo);
	}

	// 게시글 조회 
	public ArrayList<Board> getBoardList(SqlSessionTemplate sqlSession, PageInfo pi, Map<String, Object> map) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("myPageMapper.selectRecentBoardList", map, rowBounds);
	}

	// 게시글의 달린 코멘트 개수 조회 
	public int getBoardCommentCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("myPageMapper.selectBoardCommentCount", boardNo);
	}

	// 게시글의 좋아요 개수 조회 
	public int getBoardLikeCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("myPageMapper.selectBoardLikeCount", boardNo);
		
	}

	// 게시글 삭제 
	public int removeBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("myPageMapper.removeBoard", boardNo);
	}

	// 댓글 개수 조회 
	public int getCommentCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectCommentCount", memberNo);
	}

	// 댓글 조회 
	public ArrayList<MyPageBoardCommentDTO> getBoardCommentList(SqlSessionTemplate sqlSession, PageInfo commentPI,
			int memberNo) {
		int offset = (commentPI.getCurrentPage() - 1) * commentPI.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, commentPI.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("myPageMapper.selectCommentList", memberNo, rowBounds);
	}

	// 리뷰 개수 조회 
	public int getReviewCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectReviewCount", memberNo);
	}

	// 리뷰 조회 
	public ArrayList<Review> getReviewList(SqlSessionTemplate sqlSession, PageInfo reviewPI, int memberNo) {
		
		int offset = (reviewPI.getCurrentPage() - 1) * reviewPI.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, reviewPI.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("myPageMapper.selectReviewList", memberNo, rowBounds);
	}

	// 스크랩한 레시피 조회 
	public ArrayList<MyPageScrapRecipeDTO> getScrapRecipeList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectScrapRecipeList", memberNo);
	}

	// 스크랩한 레시피 삭제 
	public int deleteScrapRecipe(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("myPageMapper.deleteScrapRecipe", map);
	}

	// 스크랩한 게시글 조회 
	public ArrayList<MyPageScrapBoardDTO> getScrapBoardList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectScrapBoard", memberNo);
	}

	// 스크랩 게시글 삭제 
	public int deleteScrapBoard(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("myPageMapper.deleteScrapBoard", map);
	}
	
	// 스크랩 상품 조회
	public ArrayList<MyPageScrapProductDTO> getScrapProduct(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectScrapProduct", memberNo);
	}
	
	// 스크랩 상품 삭제
	public int deleteScrapProduct(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("myPageMapper.deleteScrapProduct", map);
	}

	// 좋아요 레시피 조회
	public ArrayList<MyPageLikeRecipeDTO> getLikeRecipeList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectLikeRecipe", memberNo);
	}

	// 좋아요 레시피 삭제
	public int deleteLikeRecipe(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("myPageMapper.deleteLikeRecipe", map);
	}

	// 좋아요 게시글 조회
	public ArrayList<MyPageLikeBoardDTO> getLikeBoardList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectLikeBoard",memberNo);
	}

	// 좋아요 게시글 삭제
	public int deleteLikeBoard(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("myPageMapper.deleteLikeBoard", map);
	}

	
	

}
