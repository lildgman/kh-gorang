package com.kh.gorang.board.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.gorang.board.model.dao.BoardDao;
import com.kh.gorang.board.model.dto.BoardListDTO;
import com.kh.gorang.board.model.dto.CommentListDTO;
import com.kh.gorang.board.model.dto.InsertCommentDTO;
import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.board.model.vo.Comment;
import com.kh.gorang.common.model.vo.PageInfo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {

    private final SqlSessionTemplate sqlSession;
    private final BoardDao boardDao;

    @Override
    public int selectListCount() {
        return boardDao.selectListCount(sqlSession);
    }

    @Override
    public ArrayList<Board> selectList(PageInfo pi) {
        return boardDao.selectList(sqlSession, pi);
    }

    @Override
    public Board selectBoard(int boardNo) {
        return boardDao.selectBoard(sqlSession, boardNo);
    }

    @Override
    public int insertBoard(Board board) {
        return boardDao.insertBoard(sqlSession, board);
    }

    @Override
    public void increaseViewCount(int boardNo) {
        boardDao.increaseViewCount(sqlSession, boardNo);
    }

    @Override
    public ArrayList<Board> selectListByLatest(PageInfo pi) {
        return boardDao.selectListByLatest(sqlSession, pi);
    }

    @Override
    public ArrayList<Board> selectListByViewCount(PageInfo pi) {
        return boardDao.selectListByViewCount(sqlSession, pi);
    }

    @Override
    public ArrayList<Board> selectListByTag(PageInfo pi, String tag) {
        return boardDao.selectListByTag(sqlSession, pi, tag);
    }
   
    @Override
    public String getMemberNickname(int memberNo) {
        return boardDao.getMemberNickname(sqlSession, memberNo);
    }
    @Override
    public ArrayList<Comment> selectCommentList(int boardNo, PageInfo pi) {
        return boardDao.selectCommentList(sqlSession, boardNo, pi);
    }

    @Override
    public int insertComment(Comment comment) {
        return boardDao.insertComment(sqlSession, comment);
    }

    @Override
    public int deleteComment(int commentNo) {
        return boardDao.deleteComment(sqlSession, commentNo);
    }

	@Override
	public int getBoardCount(Map<String, Object> map) {
		return boardDao.getBoardCount(sqlSession, map);
	}

	@Override
	public ArrayList<BoardListDTO> getBoardList(PageInfo pi, Map<String, Object> map) {
		return boardDao.getBoardList(sqlSession, pi, map);
	}

	// 댓글 리스트 조회
	@Override
	public ArrayList<CommentListDTO> getCommentList(Integer boardNo) {
		return boardDao.getCommentList(sqlSession, boardNo);
	}

	@Override
	public int insertReReply(InsertCommentDTO insertCommentDTO) {
		return boardDao.insertReReply(sqlSession, insertCommentDTO);
	}

	@Override
	public String getExBoardThumbnail(int boardNo) {
		return boardDao.getExBoardThumbnail(sqlSession, boardNo);
	}

	@Override
	public int updateBoard(Board board) {
		return boardDao.updateBoard(sqlSession, board);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return boardDao.deleteBoard(sqlSession, boardNo);
	}

	@Override
	public int insertLikeBoard(Map<String, Object> map) {

		//like_board에 memberNo와 boardNo를 갖고 있는 컬럼이 있는지 확인 후
		// 없다면 Insert, 있다면 update해주자.;
		// return이 0이면 실
		// return이 1이면 좋아요 취소
		// return이 2이면 좋아요 
		
		int insertLikeBoardResult = 0;
		int updateLikeBoardResult = 0;
		
		int checkLikeBoardCount = boardDao.checkLikeBoard(sqlSession, map);
		
		// 좋아요 테이블에 memberNo 와 boardNo를 갖고 있는 컬럼이 있을 
		if(checkLikeBoardCount > 0) {
			updateLikeBoardResult = boardDao.updateLikeBoard(sqlSession, map);
			
			if(updateLikeBoardResult > 0) {
				int minusBoardVote = boardDao.minusBoardVote(sqlSession, map);
				
				if(minusBoardVote > 0) {
					return 1;
				}
			}
			// 좋아요 테이블에 memberNo 와 boardNo를 갖고 있는 컬럼이 없을 때 
		} else {
			// 좋아요 테이블에 memberNo 와 boardNo를 갖고 있는 컬럼이 있지만 상태가 N일 
			int checkLikedBoardStatusN = boardDao.checkLikedBoardStatusN(sqlSession, map);
			
			if (checkLikedBoardStatusN > 0) {
				int updateLikedBoardStatus = boardDao.updateLikedBoardStatus(sqlSession, map);
				
				if(updateLikedBoardStatus > 0) {
					int plusBoardVote = boardDao.plusBoardVote(sqlSession, map);
					if(plusBoardVote > 0) {
						return 2;
					}
				}
				
			} else {
				insertLikeBoardResult = boardDao.insertLikeBoard(sqlSession, map);
				
				if(insertLikeBoardResult > 0) {
					int plusBoardVote = boardDao.plusBoardVote(sqlSession, map);
					
					if(plusBoardVote > 0) {
						return 2;
					}
					
				}
			}
			
		}
		
		return 0;
	}

	@Override
	public int isLikedBoard(Map<String, Object> map) {
		return boardDao.isLikedBoard(sqlSession, map);
	}

}
