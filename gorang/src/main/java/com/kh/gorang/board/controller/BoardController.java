package com.kh.gorang.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.board.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	@RequestMapping("main.bo")
	public String boardMain() {
		return "board/boardMain";
	}
	
	@RequestMapping("write.bo")
	public String commonWrite() {
		return "board/commonWrite";
	}
	
	@RequestMapping("detail.bo")
	public String boardDetail() {
		return "board/boardDetail";
		
	}
	@RequestMapping("insert.bo")
	public String insertBoard(Board board,HttpSession session, Model model) {
		int result = boardService.insertBoard(board);
		if(result>0) {
			return "board/boardMain";
		}
		else {
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "board/commonWrite";
		}
	}
}
