package com.kh.gorang.member.controller;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	//마이페이지 메인
	@RequestMapping("myPageAllView.me")
	public String myPageViewAll(){
		return "member/myPageAllView";
	}
	
	//마이페이지 레시피게시판
	@RequestMapping("myRecipeBoard.me")
	public String myRecipeBoard(){
		return "member/myRecipeBoard";
	}
	
	//마이페이지 자유게시판
	@RequestMapping("myBoard.me")
	public String myBoard(){
		return "member/myPageBoard";
	}

	//마이페이지 나의냉장고
	@RequestMapping("myRefrigerator.me")
	public String myRefrigerator(){
		return "member/myRefrigerator";
	}
	
	//내 정보 수정
	@RequestMapping("myPageInfoEdit.me")
	public String myPageInfoEdit(){
		return "member/myPageInfoEdit";
	}
	
	//구매내역
	@RequestMapping("myPageBuyList.me")
	public String myPageBuyList(){
		return "member/myPageBuyList";
	}
	
	//마이 페이지 질의응답
	@RequestMapping("myPageQnA.me")
	public String myPageQnAView(){
		return "member/myPageQnA";
	}
	
	//마이 페이지 리뷰
	@RequestMapping("myPageReplyReview.me")
	public String myPageReplyReviewView(){
		return "member/myPageReplyReview";
	}
	
}


