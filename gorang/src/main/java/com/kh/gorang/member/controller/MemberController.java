package com.kh.gorang.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.gorang.member.model.vo.Member;
import com.kh.gorang.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, ModelAndView mv, HttpSession session) {	
		//암호화 후
		//Member m의 id => 사용자가 입력한 아이디
		//		 m의 pwd => 사용자가 입력한 pwd(평문)
		
		Member loginUser = memberService.loginMember(m);
		
		// loginUser id => 아이디로 db에서 검색해온 id
		//loginUser pwd => db에 기록된 암호화된 비밀번호
		
		
		//bcryptPasswordEncoder객체의 matches()
		//matches(평문, 암호문)을 작성하면 내부적으로 복호화작업 후 비교가 이루어짐
		//두 구문이 일치하면 true를 반환 일치하지않으면 false 반환
		
		bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd());
		// 아이디가 없는 경우
		if (loginUser == null) { 
			session.setAttribute("alertMsg", "아이디가 일치하지 않습니다.");
			mv.setViewName("member/loginForm.me");
			
			//비밀번호가 다른경우
		} else if (!bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())){ 
			session.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
			mv.setViewName("member/loginForm.me");
			
		} else { // 성공
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session){
		//로그아웃 -> session에서 loginUser 삭제, 만료
		//session.invalidate();
		session.removeAttribute("loginUser");
		
		return "redirect:/";
	}
	
	/*
	 * ajax요청에 대한 응답을 위한 controller에는 @ResponseBody어노테이션을 작성해줘야한다.
	 * 기본적인 세팅이 jsp응답으로 되어있기 때문에 @ResponseBody을작성해주면
	 * 반환값을 http응답 객체에 직접 작성하겠다라는 의미를 가지고있다.
	 */
	//idCheck ajax요청을 받아줄 controller
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		int result = memberService.idCheck(checkId);
		
		if (result > 0) {// 이미존재한다면
			return "NNNNN";
		} else { //존재하지않는다면
			return "NNNNY";
		}
		
		//return memberService.idCheck(checkId) > 0 ? "NNNNN" : "NNNNY";
	}
	
	//회원 정보 저장
	/*
	 * ajax요청에 대한 응답을 위한 controller에는 @ResponseBody어노테이션을 작성해줘야한다.
	 * 기본적인 세팅이 jsp응답으로 되어있기 때문에 @ResponseBody을작성해주면
	 * 반환값을 http응답 객체에 직접 작성하겠다라는 의미를 가지고있다.
	 */
	@ResponseBody
	@RequestMapping("insert.me")
	public String insertMember(Member m, HttpSession session, Model model) {
		//암호화작업
		String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
		
		m.setMemberPwd(encPwd);
		
		int result = memberService.insertMember(m);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원가입이 완료되었습니다.");
			return "redirect:/";
		} else {
			session.setAttribute("alertMsg", "회원가입이 실패하였습니다.");
			return "member/register.me";
		}
	}
	
	
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
	
	
}


