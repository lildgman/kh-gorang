package com.kh.gorang.board.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.board.model.dto.BoardListDTO;
import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.board.model.vo.Comment;
import com.kh.gorang.common.model.vo.PageInfo;


@Repository
public class BoardDao{
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}
	
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	}
	
	public ArrayList<Board> selectListByViewCount(SqlSessionTemplate sqlSession, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList)sqlSession.selectList("boardMapper.selectListByViewCount", null, rowBounds);
    }
    
    public ArrayList<Board> selectListByLatest(SqlSessionTemplate sqlSession, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList)sqlSession.selectList("boardMapper.selectListByLatest", null, rowBounds);
    }
    
    public ArrayList<Board> selectListByTag(SqlSessionTemplate sqlSession, PageInfo pi, String tag){
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList)sqlSession.selectList("boardMapper.selectListByTag", tag, rowBounds);
    }
    
    public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
	    return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.insert("boardMapper.insertBoard",board);
	}
	
	public void increaseViewCount(SqlSessionTemplate sqlSession, int boardNo) {
        sqlSession.update("boardMapper.increaseViewCount", boardNo);
    }
	public String getMemberNickname(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("boardMapper.getMemberNickname", memberNo);
	}
	
	public ArrayList<Comment> selectCommentList(SqlSessionTemplate sqlSession, int boardNo, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList) sqlSession.selectList("commentMapper.selectCommentList", boardNo, rowBounds);
    }

    public int insertComment(SqlSessionTemplate sqlSession, Comment comment) {
        return sqlSession.insert("commentMapper.insertComment", comment);
    }

    public int deleteComment(SqlSessionTemplate sqlSession, int commentNo) {
        return sqlSession.delete("commentMapper.deleteComment", commentNo);
    }

// =====================================================================================================
	public int getBoardCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectOne("boardMapper.selectBoardCount", map);
	}

	public ArrayList<BoardListDTO> getBoardList(SqlSessionTemplate sqlSession, PageInfo pi, Map<String, Object> map) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardList", map, rowBounds);
	}
	
}
