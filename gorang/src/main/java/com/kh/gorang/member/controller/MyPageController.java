package com.kh.gorang.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.common.template.Pagination;
import com.kh.gorang.common.vo.PageInfo;
import com.kh.gorang.member.model.vo.Member;
import com.kh.gorang.member.model.vo.MyPageBoardCommentDTO;
import com.kh.gorang.member.model.vo.MyPageBoardDTO;
import com.kh.gorang.member.model.vo.MyPageLikeRecipeDTO;
import com.kh.gorang.member.model.vo.MyPageRecipeDTO;
import com.kh.gorang.member.model.vo.MyPageScrapBoardDTO;
import com.kh.gorang.member.model.vo.MyPageScrapProductDTO;
import com.kh.gorang.member.model.vo.MyPageScrapRecipeDTO;
import com.kh.gorang.member.model.vo.Review;
import com.kh.gorang.member.service.MyPageService;
import com.kh.gorang.recipe.model.vo.Recipe;
import com.kh.gorang.shopping.model.vo.Product;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MyPageController {
	
	private final MyPageService myPageService;

	//마이페이지 메인
	@RequestMapping("main.me")
	public String myPageViewAll(HttpSession session, Model model){
		
		int memberNo = getLoginUserNo(session);	
		addAttributeUserInfo(model, memberNo);
		
		// 내 레시피 중 조회수 많은 순으로 레시피 리스트 가져오기
		ArrayList<Recipe> mostViewRecipeList = myPageService.getMostViewRecipeList(memberNo);	
		
		// 내 게시글 중 조회수 많은 순으로 게시글 리스트 가져오기
		ArrayList<Board> resultBoardList = myPageService.getMostViewBoardList(memberNo);
			
		// 스크랩한 내용물들 리스트
		ArrayList<Object> scrapContentList = myPageService.getScrapList(memberNo);
		// 객체 타입을 체크해서 Map에 저장하고 JSP로 넘기자
		ArrayList<Map<String, Object>> processedScrapList = getProcessedList(scrapContentList);
		
		// 좋아요한 내용물들 리스트
		ArrayList<Object> likeContentList = myPageService.getLikeContentList(memberNo);
		// 객체 타입을 체크해서 Map에 저장하고 JSP로 넘기자
		ArrayList<Map<String, Object>> processedLikedList = getProcessedList(likeContentList);
		
		log.info("processedScrapList",processedScrapList);
		log.info("processedLikedList",processedLikedList);
		
		model.addAttribute("mostViewRecipeList", mostViewRecipeList);
		model.addAttribute("resultBoardList",resultBoardList);
		model.addAttribute("processedScrapList", processedScrapList);
		model.addAttribute("processedLikedList", processedLikedList);
		
		return "member/myPageAllView";
	}


	//마이페이지 레시피게시판
	@RequestMapping("recipe.me")
	public String myRecipeBoard(HttpSession session, 
			@RequestParam(defaultValue="1") int cpage,
			@RequestParam(defaultValue="recent") String sort,
			Model model){
		
		// 회원정보들
		int memberNo = getLoginUserNo(session);
		addAttributeUserInfo(model, memberNo);
		
		// 레시피 페이지네이션
		int myRecipeCount = myPageService.getMyRecipeCount(memberNo);
		PageInfo pi = Pagination.getPageInfo(myRecipeCount, cpage, 10, 6);	
				
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("sortingMethod", sort);
		
		ArrayList<MyPageRecipeDTO> recipeList = myPageService.getRecipeList(pi, map);
			
		model.addAttribute("recipeList", recipeList);
		model.addAttribute("pi",pi);
		model.addAttribute("sort", sort);
		
		return "member/myRecipeBoard";
	}
	
	@PostMapping("remove-recipe.me")
	@ResponseBody
	public String removeMyRecipe(int recipeNo) {
		
		int result = myPageService.removeRecipe(recipeNo);
		
		if(result > 0) {
			return "done";
		} else {
			return "undone";
		}
	}
	
	
	//마이페이지 자유게시판
	@RequestMapping("board.me")
	public String myBoard(HttpSession session,
			@RequestParam(defaultValue="1") int cpage,
			@RequestParam(defaultValue="recent") String sort,
			Model model){
		
		int memberNo = getLoginUserNo(session);
		addAttributeUserInfo(model, memberNo);
		
		// 게시글 페이지네이션
		int boardCount = myPageService.getBoardCount(memberNo);
		PageInfo pi = Pagination.getPageInfo(boardCount, cpage, 10, 6);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("sort", sort);
		
		ArrayList<MyPageBoardDTO> boardList = myPageService.getBoardList(pi, map);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pi", pi);
		model.addAttribute("sort", sort);
		
		return "member/myPageBoard";
	}
	
	@PostMapping("remove-board.me")
	@ResponseBody
	public String removeMyBoard(int boardNo) {

		int result = myPageService.removeBoard(boardNo);
		
		if(result > 0) {
			return "done";
		} else {
			return "undone";
		}
		
	}

	//마이페이지 나의냉장고
	@RequestMapping("myRefrigerator.me")
	public String myRefrigerator(){
		return "member/myRefrigerator";
	}
	
	//내 정보 수정
	@RequestMapping("edit.me")
	public String myPageInfoEdit(){
		return "member/myPageInfoEdit";
	}
	

	
	//마이 페이지 질의응답
	@RequestMapping("qna.me")
	public String myPageQnAView(){
		return "member/myPageQnA";
	}
	
	//마이 페이지 리뷰
	@RequestMapping("review.me")
	public String myPageReplyReviewView(
				HttpSession session,
				@RequestParam(defaultValue="1") int comment_cpage,
				@RequestParam(defaultValue="1") int review_cpage,
				Model model){
		
		int memberNo = getLoginUserNo(session);
		addAttributeUserInfo(model, memberNo);
		
		// 댓글 부분
		int commentCount = myPageService.getCommentCount(memberNo);
		PageInfo commentPI = Pagination.getPageInfo(commentCount, comment_cpage, 10, 5);
		
		ArrayList<MyPageBoardCommentDTO> boardCommentList = myPageService.getBoardCommentList(commentPI, memberNo);
		
		// 후기 부분
		int reviewCount = myPageService.getReviewCount(memberNo);
		PageInfo reviewPI = Pagination.getPageInfo(reviewCount, review_cpage, 10, 5);
		
		ArrayList<Review> reviewList = myPageService.getReviewList(reviewPI, memberNo);
		
		model.addAttribute("boardCommentList", boardCommentList);
		model.addAttribute("commentPI", commentPI);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewPI", reviewPI);
		
		return "member/myPageReplyReview";
	}
	
	//비밀번호 체크
	@RequestMapping("checkPwd.me")
	public String myPageCheckPwd(){
		return "member/myPageCheckPwd";
	}
	
	//좋아요
	@RequestMapping("likeRecipe.me")
	public String myPageLikeRecipe(
			HttpSession session,
			Model model){
		
		int memberNo = getLoginUserNo(session);
		addAttributeUserInfo(model, memberNo);
		
		ArrayList<MyPageLikeRecipeDTO> likeRecipeList = myPageService.getLikeRecipeList(memberNo);
		
		model.addAttribute("likeRecipeList",likeRecipeList);
		
		return "member/myPageLikeRecipe";
	}
	@RequestMapping("likeBoard.me")
	public String myPageLikeBoard(){
		return "member/myPageLikeBoard";
	}
	
	@RequestMapping("loginForm.me")
	public String login(){
		return "member/loginPage";
	}
	
	@RequestMapping("register.me")
	public String storeMainForm() {
		return "member/registerPage";
	}
	
	@RequestMapping("scrapBoard.me")
	public String myPageScrapBoard(
				HttpSession session,
				Model model){
		int memberNo = getLoginUserNo(session);
		addAttributeUserInfo(model, memberNo);
		
		ArrayList<MyPageScrapBoardDTO> scrapBoardList = myPageService.getScrapBoardList(memberNo);
		
		model.addAttribute("scrapBoardList", scrapBoardList);
		
		return "member/myPageScrapBoard";
	}
	
	@ResponseBody
	@PostMapping("delete-scrap-board.me")
	public String deleteScrapBoard(
			HttpSession session,
			@RequestParam int boardNo) {

		int memberNo = getLoginUserNo(session);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("boardNo", boardNo);
		
		int result = myPageService.deleteScrapBoard(map);
		
		if(result > 0) {
			return "done";
		} else {
			return "undone";
		}
	}
	
	@RequestMapping("scrapProduct.me")
	public String myPageScrapProduct(
			HttpSession session,
			Model model){
		
		int memberNo = getLoginUserNo(session);
		addAttributeUserInfo(model, memberNo);
		
		ArrayList<MyPageScrapProductDTO> scrapProductList = myPageService.getScrapProduct(memberNo);
		model.addAttribute("scrapProductList", scrapProductList);
		
		return "member/myPageScrapProduct";
	}
	
	@PostMapping("delete-scrap-product.me")
	@ResponseBody
	public String deleteScrapProduct(
			HttpSession session,
			@RequestParam int productNo) {
		
		log.info("productNo = {}" , productNo);
		
		int memberNo = getLoginUserNo(session);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("productNo", productNo);
		
		int result = myPageService.deleteScrapProduct(map);
		
		if(result > 0) {
			return "done";
		} else {
			return "undone";
		}
	}
	
	@RequestMapping("scrapRecipe.me")
	public String myPageScrapRecipe(
				HttpSession session,
				Model model){
		
		int memberNo = getLoginUserNo(session);
		addAttributeUserInfo(model, memberNo);
		
		ArrayList<MyPageScrapRecipeDTO> scrapRecipeList = myPageService.getScrapRecipeList(memberNo);
		
		model.addAttribute("scrapRecipeList", scrapRecipeList);
		
		return "member/myPageScrapRecipe";
	}
	
	@ResponseBody
	@PostMapping("delete-scrap-recipe.me")
	public String myPageDeleteScrapRecipe(
			HttpSession session,
			@RequestParam int recipeNo) {
		
		int memberNo = getLoginUserNo(session);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("recipeNo", recipeNo);
		
		int result = myPageService.deleteScrapRecipe(map);
		
		if(result > 0) {
			return "done";
		} else {
			return "undone";
		}
		
	}
	
	private void addAttributeUserInfo(Model model, int memberNo) {
		// 팔로잉 수
		int followingCount = myPageService.getFollowingCount(memberNo);
		model.addAttribute("followingCount", followingCount);
		// 팔로워 수
		int followerCount = myPageService.getFollowerCount(memberNo);
		model.addAttribute("followerCount", followerCount);
		// 총 스크랩 수
		int totalScrapCount = myPageService.getTotalScrapCount(memberNo);
		model.addAttribute("totalScrapCount", totalScrapCount);
		// 총 좋아요 개수
		int totalLikeCount = myPageService.getTotalLikeCount(memberNo);
		model.addAttribute("totalLikeCount", totalLikeCount);
	}

	private int getLoginUserNo(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int memberNo = loginUser.getMemberNo();
		return memberNo;
	}
	
	
	private ArrayList<Map<String, Object>> getProcessedList(ArrayList<Object> contentList) {
		ArrayList<Map<String, Object>> processedList = new ArrayList<Map<String,Object>>();
		for(Object obj : contentList) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("object",obj);
			if(obj instanceof Board) {
				map.put("type","Board");
			} else if (obj instanceof Recipe) {
				map.put("type", "Recipe");
			} else if(obj instanceof Product) {
				map.put("type", "Product");
			}
			processedList.add(map);
		}
		return processedList;
	}
}
