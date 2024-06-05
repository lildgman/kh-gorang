package com.kh.gorang.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.common.template.Pagination;
import com.kh.gorang.common.vo.PageInfo;
import com.kh.gorang.member.model.vo.Member;
import com.kh.gorang.member.service.MyPageService;
import com.kh.gorang.recipe.model.vo.MyPageRecipeDTO;
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
			Model model){
		
		// 회원정보들
		int memberNo = getLoginUserNo(session);
		addAttributeUserInfo(model, memberNo);
		
		// 레시피 페이지네이션
		int myRecipeCount = myPageService.getMyRecipeCount(memberNo);
		PageInfo pi = Pagination.getPageInfo(myRecipeCount, cpage, 10, 6);	
				
		ArrayList<MyPageRecipeDTO> recipeList = myPageService.getRecentRecipeList(pi, memberNo);
			
		model.addAttribute("recipeList", recipeList);
		model.addAttribute("pi",pi);
		
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
	public String myBoard(){
		return "member/myPageBoard";
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
	
	//구매내역
	@RequestMapping("buyList.me")
	public String myPageBuyList(){
		return "member/myPageBuyList";
	}
	
	//마이 페이지 질의응답
	@RequestMapping("qna.me")
	public String myPageQnAView(){
		return "member/myPageQnA";
	}
	
	//마이 페이지 리뷰
	@RequestMapping("review.me")
	public String myPageReplyReviewView(){
		return "member/myPageReplyReview";
	}
	
	//비밀번호 체크
	@RequestMapping("checkPwd.me")
	public String myPageCheckPwd(){
		return "member/myPageCheckPwd";
	}
	
	//좋아요
	@RequestMapping("likeRecipe.me")
	public String myPageLikeRecipe(){
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
	public String myPageScrapBoard(){
		return "member/myPageScrapBoard";
	}
	
	@RequestMapping("scrapProduct.me")
	public String myPageScrapProduct(){
		return "member/myPageScrapProduct";
	}
	
	@RequestMapping("scrapRecipe.me")
	public String myPageScrapRecipe(){
		return "member/myPageScrapRecipe";
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
