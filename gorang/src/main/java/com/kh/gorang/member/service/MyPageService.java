package com.kh.gorang.member.service;

import java.util.ArrayList;

import com.kh.gorang.board.model.vo.Board;
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

	// 스크랩 내용 조회
	ArrayList<Object> getScrapList(int memberNo);

}