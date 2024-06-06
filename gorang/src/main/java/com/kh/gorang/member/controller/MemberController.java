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
		
		Member loginUser = memberService.loginMember(m);
	
		// 아이디가 없는 경우
		if (loginUser == null) { 
			session.setAttribute("alertMsg", "아이디가 일치하지 않습니다.");
			mv.setViewName("member/loginPage");
			
			//비밀번호가 다른경우
		} else if (!bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())){ 
			session.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
			mv.setViewName("member/loginPage");
			
		} else { // 성공
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	
	// 로그아웃
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session){
		//로그아웃 -> session에서 loginUser 삭제, 만료
		//session.invalidate();
		session.removeAttribute("loginUser");
		
		return "redirect:/";
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		return memberService.idCheck(checkId) > 0 ? "NNNNN" : "NNNNY";
	}
	
	// 닉네임 중복 체크
	@ResponseBody
	@RequestMapping("nameCheck.me")
	public String nameCheck(String checkName) {
		return memberService.nameCheck(checkName) > 0 ? "NNNNN" : "NNNNY";
	}
	

	//회원 정보 저장
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
}


