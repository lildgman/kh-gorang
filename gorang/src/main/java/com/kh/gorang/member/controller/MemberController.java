package com.kh.gorang.member.controller;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	//마이페이지 메인
	@RequestMapping("main.me")
	public String myPageViewAll(){
		return "member/myPageAllView";
	}
	
	//마이페이지 레시피게시판
	@RequestMapping("recipe.me")
	public String myRecipeBoard(){
		return "member/myRecipeBoard";
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
	
	@RequestMapping("login.me")
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
	
	
}


