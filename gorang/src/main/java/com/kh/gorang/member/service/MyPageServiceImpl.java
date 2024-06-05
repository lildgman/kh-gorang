package com.kh.gorang.member.service;

import java.util.ArrayList;
import java.util.Collections;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.member.model.dao.MyPageDao;
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
		int boardLikeCount = myPageDao.getBoardLikeCount(sqlSession, memberNo);
		
		// 레시피 좋아요 수 조회
		int recipeLikeCount = myPageDao.getRecipeLikeCount(sqlSession, memberNo);
		
		return boardLikeCount + recipeLikeCount;
	}

	// 조회수가 많은 순으로 정렬된 레시피 조회 3개
	@Override
	public ArrayList<Recipe> getMostViewRecipeList(int memberNo) {
		
		ArrayList<Recipe> list = myPageDao.getMostViewRecipeList(sqlSession, memberNo);
		
		ArrayList<Recipe> resultList = new ArrayList<Recipe>(list.subList(0, 3));
		
		return resultList;
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
		ArrayList<Object> scrapList = new ArrayList<Object>(allScrapList.subList(0, 4));		
	
		return scrapList;
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
		ArrayList<Object> likeList = new ArrayList<Object>(allLikeList.subList(0, 4));
	
		return likeList;
	}

}
