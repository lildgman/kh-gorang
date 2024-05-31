package com.kh.gorang.board.controller;

import static com.kh.gorang.common.template.SaveFileController.saveFile;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.board.service.BoardService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
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
	
	@PostMapping("insert.bo")
	public String insertBoard(Board board, HttpSession session, Model model, @RequestParam("file") MultipartFile file) {
		
		log.info("file={}",file);
		if(!file.getOriginalFilename().equals("")) {
			String changeFileName = saveFile(file, session, "/board/boardMainContentFile/");
			board.setBoardThumbnail(changeFileName);
		}
		
		log.info("file={}",file);
		log.info("board={}", board);
		int result = boardService.insertBoard(board);
		if(result>0) {
			return "board/boardMain";
		}
		else {
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "board/write.bo";
		}
	}
}