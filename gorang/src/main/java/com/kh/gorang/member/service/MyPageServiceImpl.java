package com.kh.gorang.member.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.common.vo.PageInfo;
import com.kh.gorang.member.model.dao.MyPageDao;
import com.kh.gorang.member.model.vo.Member;
import com.kh.gorang.member.model.vo.MyPageBoardCommentDTO;
import com.kh.gorang.member.model.vo.MyPageBoardDTO;
import com.kh.gorang.member.model.vo.MyPageLikeBoardDTO;
import com.kh.gorang.member.model.vo.MyPageLikeRecipeDTO;
import com.kh.gorang.member.model.vo.MyPageRecipeDTO;
import com.kh.gorang.member.model.vo.MyPageScrapBoardDTO;
import com.kh.gorang.member.model.vo.MyPageScrapProductDTO;
import com.kh.gorang.member.model.vo.MyPageScrapRecipeDTO;
import com.kh.gorang.member.model.vo.Review;
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

	//레시피 조회
	@Override
	public ArrayList<MyPageRecipeDTO> getRecipeList(PageInfo pi, Map<String, Object> map) {
		
		ArrayList<MyPageRecipeDTO> result = new ArrayList<MyPageRecipeDTO>();
		
		ArrayList<Recipe> recipeList = myPageDao.getRecipeList(sqlSession, pi ,map);
		
		for(Recipe recipe : recipeList) {
			int recipeReviewCount = myPageDao.getRecipeReviewCount(sqlSession, recipe.getRecipeNo());
			int recipeLikeCount = myPageDao.getRecipeLikeCount(sqlSession, recipe.getRecipeNo());
			MyPageRecipeDTO myPageRecipeDTO = new MyPageRecipeDTO(recipe, recipeReviewCount, recipeLikeCount);
			result.add(myPageRecipeDTO);
		}
		
		return result;
	}

	// 레시피 삭제 
	@Override
	public int removeRecipe(int recipeNo) {
		return myPageDao.removeRecipe(sqlSession, recipeNo);
	}

	// 나의 게시글 개수 조회 
	@Override
	public int getBoardCount(int memberNo) {
		return myPageDao.getBoardCount(sqlSession, memberNo);
	}

	// 게시글 조회 
	@Override
	public ArrayList<MyPageBoardDTO> getBoardList(PageInfo pi, Map<String, Object> map) {
		
		ArrayList<MyPageBoardDTO> result = new ArrayList<>();
		
		ArrayList<Board> boardList = myPageDao.getBoardList(sqlSession, pi, map);
		
		for(Board board : boardList) {
			int boardCommentCount = myPageDao.getBoardCommentCount(sqlSession, board.getBoardNo());
			int boardLikeCount = myPageDao.getBoardLikeCount(sqlSession, board.getBoardNo());
			MyPageBoardDTO boardInfo = new MyPageBoardDTO(board, boardCommentCount, boardLikeCount);
			result.add(boardInfo);
		}
		
		log.info("result={}",result);
		return result;
	}

	//게시글 삭제
	@Override
	public int removeBoard(int boardNo) {
		return myPageDao.removeBoard(sqlSession, boardNo);
	}

	// 댓글 개수 조회 
	@Override
	public int getCommentCount(int memberNo) {
		return myPageDao.getCommentCount(sqlSession, memberNo);
	}

	// 댓글 조회 
	@Override
	public ArrayList<MyPageBoardCommentDTO> getBoardCommentList(PageInfo commentPI, int memberNo) {
		return myPageDao.getBoardCommentList(sqlSession, commentPI, memberNo);
	}

	// 리뷰개수조회 
	@Override
	public int getReviewCount(int memberNo) {
		return myPageDao.getReviewCount(sqlSession, memberNo);
	}

	//리뷰 리스트 조회 
	@Override
	public ArrayList<Review> getReviewList(PageInfo reviewPI, int memberNo) {
		return myPageDao.getReviewList(sqlSession, reviewPI, memberNo);
	}

	//스크랩 리스트 조회 
	@Override
	public ArrayList<MyPageScrapRecipeDTO> getScrapRecipeList(int memberNo) {
		return myPageDao.getScrapRecipeList(sqlSession, memberNo);
	}

	// 스크랩 레시피 삭제 
	@Override
	public int deleteScrapRecipe(Map<String, Object> map) {
		return myPageDao.deleteScrapRecipe(sqlSession, map);
	}

	// 스크랩 게시글 조회 
	@Override
	public ArrayList<MyPageScrapBoardDTO> getScrapBoardList(int memberNo) {
		return myPageDao.getScrapBoardList(sqlSession, memberNo);
	}

	// 스크랩 게시글 삭제 
	@Override
	public int deleteScrapBoard(Map<String, Object> map) {
		return myPageDao.deleteScrapBoard(sqlSession, map);
	}

	// 스크랩 상품 조회
	@Override
	public ArrayList<MyPageScrapProductDTO> getScrapProduct(int memberNo) {
		return myPageDao.getScrapProduct(sqlSession, memberNo);
	}
	
	// 스크랩 상품 삭제
	@Override
	public int deleteScrapProduct(Map<String, Object> map) {
		return myPageDao.deleteScrapProduct(sqlSession, map);
	}

	// 좋아요 레시피 조회
	@Override
	public ArrayList<MyPageLikeRecipeDTO> getLikeRecipeList(int memberNo) {
		return myPageDao.getLikeRecipeList(sqlSession, memberNo);
	}

	// 좋아요 레시피 삭제
	@Override
	public int deleteLikeRecipe(Map<String, Object> map) {
		return myPageDao.deleteLikeRecipe(sqlSession, map);
	}

	// 좋아요 게시글 조회
	@Override
	public ArrayList<MyPageLikeBoardDTO> getLikeBoardList(int memberNo) {
		return myPageDao.getLikeBoardList(sqlSession, memberNo);
	}

	// 좋아요 게시글 삭제
	@Override
	public int deleteLikeBoard(Map<String, Object> map) {
		return myPageDao.deleteLikeBoard(sqlSession, map);
	}

	// 회원 닉네임 중복체크
	@Override
	public int checkMemberNickname(Map<String, Object> map) {
		return myPageDao.checkMemberNickname(sqlSession, map);
	}

	// 회원 전화번호 중복체크
	@Override
	public int checkMemberPhone(Map<String, Object> map) {
		return myPageDao.checkMemberPhone(sqlSession, map);
	}

	// 회원 정보 업데이트
	@Override
	public Member updateMemberInfo(Member member) {
		
		int result = myPageDao.updateMemberInfo(sqlSession, member);
		
		if(result > 0) {
			return myPageDao.selectMember(sqlSession, member.getMemberNo());
		}
		
		return null;
	}

	

	
}
