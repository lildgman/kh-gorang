package com.kh.gorang.member.service;

import java.util.ArrayList;
import java.util.Collections;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.common.vo.PageInfo;
import com.kh.gorang.member.model.dao.MyPageDao;
import com.kh.gorang.recipe.model.vo.MyPageRecipeDTO;
import com.kh.gorang.recipe.model.vo.Recipe;
import com.kh.gorang.shopping.model.vo.Product;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MyPageServiceImpl implements MyPageService{

	private final MyPageDao myPageDao;
	private final SqlSessionTemplate sqlSession;
	
	// 팔로잉 수 구하기
	@Override
	public int getFollowingCount(int memberNo) {
		return myPageDao.getFollowingCount(sqlSession, memberNo);
	}

	// 팔로워 수 조회
	@Override
	public int getFollowerCount(int memberNo) {
		return myPageDao.getFollowerCount(sqlSession, memberNo);
	}

	// 총 스크랩 수 조회
	@Override
	public int getTotalScrapCount(int memberNo) {

		// 게시글 스크랩 수 구하기
		int boardScrapCount = myPageDao.getBoardScrapCount(sqlSession, memberNo);
		
		// 상품 스크랩 수 구하기
		int productScrapCount = myPageDao.getProductScrapCount(sqlSession, memberNo);
		
		// 레시피 스크랩 수 구하기
		int recipeScrapCount = myPageDao.getRecipeScrapCount(sqlSession, memberNo);
		
				
		return boardScrapCount + productScrapCount + recipeScrapCount;
	}

	// 총 좋아요 수 조회
	@Override
	public int getTotalLikeCount(int memberNo) {
		
		// 게시글 좋아요 수 조회
		int boardLikeCount = myPageDao.getTotalBoardLikeCount(sqlSession, memberNo);
		
		// 레시피 좋아요 수 조회
		int recipeLikeCount = myPageDao.getTotalRecipeLikeCount(sqlSession, memberNo);
		
		return boardLikeCount + recipeLikeCount;
	}

	// 조회수가 많은 순으로 정렬된 레시피 조회 3개
	@Override
	public ArrayList<Recipe> getMostViewRecipeList(int memberNo) {
		
		return myPageDao.getMostViewRecipeList(sqlSession, memberNo);
	}

	// 조회수가 많은 순으로 정렬된 게시글 조회
	@Override
	public ArrayList<Board> getMostViewBoardList(int memberNo) {
			
		return myPageDao.getMostViewBoardList(sqlSession, memberNo);
	}

	// 스크랩한 내용물들 조회
	@Override
	public ArrayList<Object> getScrapList(int memberNo) {

		ArrayList<Object> allScrapList = new ArrayList<Object>();
		
		ArrayList<Recipe> scrapRecipeList = myPageDao.getMostViewScrapedRecipeList(sqlSession, memberNo);
		for(Recipe r : scrapRecipeList) {
			allScrapList.add(r);
		}
		
		ArrayList<Board> scrapBoardList = myPageDao.getMostViewScrapedBoardList(sqlSession, memberNo);
		for(Board b : scrapBoardList) {
			allScrapList.add(b);
		}
		
		ArrayList<Product> scrapProductList = myPageDao.getMostViewScrapedProductList(sqlSession, memberNo);
		for(Product p : scrapProductList) {
			allScrapList.add(p);
		}
		
		Collections.shuffle(allScrapList);
		
		return allScrapList;
		
	}

	// 좋아요 누른 내용물들 조회
	@Override
	public ArrayList<Object> getLikeContentList(int memberNo) {
		
		ArrayList<Object> allLikeList = new ArrayList<Object>();
		
		ArrayList<Recipe> likeRecipeList = myPageDao.getLikedRecipeList(sqlSession, memberNo);
		for(Recipe r : likeRecipeList) {
			allLikeList.add(r);
		}
		
		ArrayList<Board> likeBoardList = myPageDao.getLikedBoardList(sqlSession, memberNo);
		for(Board b : likeBoardList) {
			allLikeList.add(b);
		}
		
		Collections.shuffle(allLikeList);	
		
		return allLikeList;
		
	}

	// 나의 레시피 개수 조회
	@Override
	public int getMyRecipeCount(int memberNo) {
		return myPageDao.getMyRecipeCount(sqlSession, memberNo);
	}

	// 최신순으로 정렬한 레시피 조회
	@Override
	public ArrayList<MyPageRecipeDTO> getRecentRecipeList(PageInfo pi, int memberNo) {
		
		ArrayList<MyPageRecipeDTO> result = new ArrayList<MyPageRecipeDTO>();
		
		ArrayList<Recipe> recipeList = myPageDao.getRecentRecipeList(sqlSession, pi ,memberNo);
		
		for(Recipe recipe : recipeList) {
			int recipeCommentCount = myPageDao.getRecipeCommentCount(sqlSession, recipe.getRecipeNo());
			int recipeLikeCount = myPageDao.getRecipeLikeCount(sqlSession, recipe.getRecipeNo());
			MyPageRecipeDTO myPageRecipeDTO = new MyPageRecipeDTO(recipe, recipeCommentCount, recipeLikeCount);
			result.add(myPageRecipeDTO);
		}
		
		log.info("result={}",result);
		
		
		return result;
	}

	// 레시피 삭제 
	@Override
	public int removeRecipe(int recipeNo) {
		return myPageDao.removeRecipe(sqlSession, recipeNo);
	}

}
