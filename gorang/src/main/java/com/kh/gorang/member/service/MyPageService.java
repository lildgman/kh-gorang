package com.kh.gorang.member.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.board.model.vo.BoardComment;
import com.kh.gorang.board.model.vo.MyPageBoardDTO;
import com.kh.gorang.common.vo.PageInfo;
import com.kh.gorang.member.model.vo.Review;
import com.kh.gorang.recipe.model.vo.MyPageRecipeDTO;
import com.kh.gorang.recipe.model.vo.Recipe;

public interface MyPageService {

	// 팔로잉 수 조회
	int getFollowingCount(int memberNo);

	// 팔로워 수 조회
	int getFollowerCount(int memberNo);

	// 총 스크랩 수 조회
	int getTotalScrapCount(int memberNo);

	// 총 좋아요 수 조회
	int getTotalLikeCount(int memberNo);

	// 조회수가 많은 순으로 정렬된 레시피
	ArrayList<Recipe> getMostViewRecipeList(int memberNo);

	// 조회수가 많은 순으로 정렬된 게시글
	ArrayList<Board> getMostViewBoardList(int memberNo);

	// 스크랩 내용물들 조회
	ArrayList<Object> getScrapList(int memberNo);

	// 좋아요 내용물들 조회
	ArrayList<Object> getLikeContentList(int memberNo);

	// 최신순으로 정렬된 레시피 조회
	ArrayList<MyPageRecipeDTO> getRecipeList(PageInfo pi, Map<String, Object> map);
	
	// 나의 레시피 개수 조회
	int getMyRecipeCount(int memberNo);

	// 레시피 삭제
	int removeRecipe(int recipeNo);

	// 게시글 개수 조회 
	int getBoardCount(int memberNo);

	// 게시글 조회 
	ArrayList<MyPageBoardDTO> getBoardList(PageInfo pi, Map<String, Object> map);

	// 게시글 삭제 
	int removeBoard(int boardNo);

	//댓글 개수 조회 
	int getCommentCount(int memberNo);

	//댓글 리스트 조회 
	ArrayList<BoardComment> getBoardCommentList(PageInfo commentPI, int memberNo);

	// 리뷰 개수 조회 
	int getReviewCount(int memberNo);

	// 리뷰 리스트 조회 
	ArrayList<Review> getReviewList(PageInfo reviewPI, int memberNo);

}
