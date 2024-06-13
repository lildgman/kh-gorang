package com.kh.gorang.board.controller;

import static com.kh.gorang.common.template.SaveFileController.saveFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.kh.gorang.board.model.dto.BoardListDTO;
import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.board.model.vo.Comment;
import com.kh.gorang.board.service.BoardService;
import com.kh.gorang.common.model.vo.PageInfo;
import com.kh.gorang.common.template.Pagination;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardService boardService;
	//게시판 메인
	@RequestMapping("main.bo")
    public String selectListBySort(
            @RequestParam(value="cpage", defaultValue="1") int currentPage,
            @RequestParam(defaultValue="all") String category,
            @RequestParam(value="sort", defaultValue="latest") String sort,
            @RequestParam(defaultValue = "") String content,
            Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category",category);
		map.put("sort",sort);
		map.put("content",content);
		
		int boardCount = boardService.getBoardCount(map);
		
		PageInfo pi = Pagination.getPageInfo(boardCount, currentPage, 16, 16);
		
		ArrayList<BoardListDTO> boardList = boardService.getBoardList(pi, map);
		
		log.info("boardList={}",boardList);
		
		model.addAttribute("category", category);
		model.addAttribute("sort", sort);
		model.addAttribute("content", content);
		model.addAttribute("pi", pi);
		model.addAttribute("boardList", boardList);
		
		
//        int boardNo = boardService.selectListCount();
//        PageInfo pi = Pagination.getPageInfo(boardNo, currentPage, 16, 16);
//
//        ArrayList<Board> list = new ArrayList<>();
//        if (sort.equals("latest")) {
//            list = boardService.selectListByLatest(pi);
//        } else if (sort.equals("viewCount")) {
//            list = boardService.selectListByViewCount(pi);
//        } else if (sort.equals("dailyTag")) {
//            list = boardService.selectListByTag(pi, "#일상");
//        } else if (sort.equals("questionTag")) {
//            list = boardService.selectListByTag(pi, "#질문");
//        } else if (sort.equals("knowHowTag")) {
//            list = boardService.selectListByTag(pi, "#노하우");
//        } else if (sort.equals("tipTag")) {
//            list = boardService.selectListByTag(pi, "#꿀팁");
//        } else if (sort.equals("methodTag")) {
//            list = boardService.selectListByTag(pi, "#보관법");
//        }
//        for (Board board : list) {
//            String memberNickname = boardService.getMemberNickname(board.getMemberNo());
//            board.setMemberNickname(memberNickname);
//        }
//        model.addAttribute("list", list);
//        model.addAttribute("pi", pi);
//        model.addAttribute("sort", sort);

        return "board/boardMain";
    }
    
	//게시글 쓰기
	@RequestMapping("write.bo")
	public String commonWrite() {
		return "board/commonWrite";
	}
	
	//게시글 상세
	@RequestMapping("detail.bo")
	public String selectBoard(@RequestParam("boardNo") Integer boardNo, Model model) {
	    if (boardNo == null) {
	        model.addAttribute("errorMsg", "게시글 번호가 유효하지 않습니다.");
	        return "board/boardMain";
	    }

	    Board board = boardService.selectBoard(boardNo);
	    
	    if (board != null) {
	    	boardService.increaseViewCount(boardNo);
	    	String memberNickname = boardService.getMemberNickname(board.getMemberNo());
            board.setMemberNickname(memberNickname);
	        model.addAttribute("board", board);
	        return "board/boardDetail";
	    } else {
	        model.addAttribute("errorMsg", "게시글 조회 실패");
	        return "board/boardMain";
	    }
	}

	//게시글 추가
	@PostMapping("insert.bo")
	public String insertBoard(
			Board board, 
			HttpSession session, 
			Model model, 
			MultipartFile file) {
		
		log.info("file={}",file);
		if(!file.getOriginalFilename().equals("")) {
			String changeFileName = saveFile(file, session, "/board/boardMainContentFile/");
			board.setBoardThumbnail(changeFileName);
		}
		
		log.info("file={}",file);
		log.info("board={}", board);
		int result = boardService.insertBoard(board);
		if(result>0) {
			return "redirect:/main.bo";
		}
		else {
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "board/write.bo";
		}
	}
	//댓글 쓰기
	@PostMapping("insert.co")
	public String insertComment(
			Comment comment,
			Model model){
	    int result = boardService.insertComment(comment);
	    if (result > 0) {
	        return "redirect:/detail.bo?boardNo=" + comment.getBoardNo();
	    } else {
	        model.addAttribute("errorMsg", "댓글 작성 실패");
	        return "board/boardDetail";
	    }
	}
	
	
}