package com.kh.gorang.board.controller;

import static com.kh.gorang.common.template.SaveFileController.saveFile;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.board.service.BoardService;
import com.kh.gorang.common.template.Pagination;
import com.kh.gorang.common.vo.PageInfo;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	//게시판 메인(최신순)
	@RequestMapping("main.bo")
    public String selectListByLatest(
            @RequestParam(value="cpage", defaultValue="1") int currentPage, 
            Model model) {
        int boardNo = boardService.selectListCount();
        PageInfo pi = Pagination.getPageInfo(boardNo, currentPage, 16, 16);
        ArrayList<Board> list = boardService.selectListByLatest(pi);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        model.addAttribute("sort", "latest"); 

        return "board/boardMain";
    }
    // 조회수순으로 게시글 메인 화면 보여주기
    @RequestMapping("mainSortView.bo")
    public String selectListByViewCount(
            @RequestParam(value="cpage", defaultValue="1") int currentPage, 
            Model model) {
        int boardNo = boardService.selectListCount();
        PageInfo pi = Pagination.getPageInfo(boardNo, currentPage, 16, 16);
        
        ArrayList<Board> list = boardService.selectListByViewCount(pi);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        model.addAttribute("sort", "viewCount");

        return "board/boardMain";
    }
    
    //일상 태그가 붙은 게시글들을 메인화면에서 보여주기 
    @RequestMapping("mainTagDaily.bo")
    public String selectListByTagDaily(
    		@RequestParam(value="cpage", defaultValue="1") int currentPage,
    		Model model) {
    	int boardNo = boardService.selectListCount();
    	PageInfo pi = Pagination.getPageInfo(boardNo, currentPage, 16, 16);
    	
    	ArrayList<Board> list = boardService.selectListByTagDaily(pi);
    	
    	model.addAttribute("list", list);
    	model.addAttribute("pi", pi);
    	model.addAttribute("sort", "dailyTag");
    	
    	return "board/boardMain";
    	
    }
  //질문 태그가 붙은 게시글들을 메인화면에서 보여주기 
    @RequestMapping("mainTagQuestion.bo")
    public String selectListByTagQuestion(
    		@RequestParam(value="cpage", defaultValue="1") int currentPage,
    		Model model) {
    	int boardNo = boardService.selectListCount();
    	PageInfo pi = Pagination.getPageInfo(boardNo, currentPage, 16, 16);
    	
    	ArrayList<Board> list = boardService.selectListByTagQuestion(pi);
    	
    	model.addAttribute("list", list);
    	model.addAttribute("pi", pi);
    	model.addAttribute("sort", "questionTag");
    	
    	return "board/boardMain";
    	
    }
    
  //노하우 태그가 붙은 게시글들을 메인화면에서 보여주기 
    @RequestMapping("mainTagKnowHow.bo")
    public String selectListByTagKnowHow(
    		@RequestParam(value="cpage", defaultValue="1") int currentPage,
    		Model model) {
    	int boardNo = boardService.selectListCount();
    	PageInfo pi = Pagination.getPageInfo(boardNo, currentPage, 16, 16);
    	
    	ArrayList<Board> list = boardService.selectListByTagKnowHow(pi);
    	
    	model.addAttribute("list", list);
    	model.addAttribute("pi", pi);
    	model.addAttribute("sort", "knowHowTag");
    	
    	return "board/boardMain";
    	
    }
    
  //꿀팁 태그가 붙은 게시글들을 메인화면에서 보여주기 
    @RequestMapping("mainTagTip.bo")
    public String selectListByTagTip(
    		@RequestParam(value="cpage", defaultValue="1") int currentPage,
    		Model model) {
    	int boardNo = boardService.selectListCount();
    	PageInfo pi = Pagination.getPageInfo(boardNo, currentPage, 16, 16);
    	
    	ArrayList<Board> list = boardService.selectListByTagTip(pi);
    	
    	model.addAttribute("list", list);
    	model.addAttribute("pi", pi);
    	model.addAttribute("sort", "tipTag");
    	
    	return "board/boardMain";
    	
    }
    
  //보관법 태그가 붙은 게시글들을 메인화면에서 보여주기 
    @RequestMapping("mainTagMethod.bo")
    public String selectListByTagMethod(
    		@RequestParam(value="cpage", defaultValue="1") int currentPage,
    		Model model) {
    	int boardNo = boardService.selectListCount();
    	PageInfo pi = Pagination.getPageInfo(boardNo, currentPage, 16, 16);
    	
    	ArrayList<Board> list = boardService.selectListByTagMethod(pi);
    	
    	model.addAttribute("list", list);
    	model.addAttribute("pi", pi);
    	model.addAttribute("sort", "methodTag");
    	
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
			@RequestParam("file") MultipartFile file) {
		
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
}