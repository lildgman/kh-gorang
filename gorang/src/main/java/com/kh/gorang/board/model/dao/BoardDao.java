package com.kh.gorang.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.board.model.vo.Board;
import com.kh.gorang.board.model.vo.Comment;
import com.kh.gorang.common.vo.PageInfo;

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
	
	public int insertComment(SqlSessionTemplate sqlSession, Comment comment) {
		return sqlSession.insert("commentMapper.insertComment", comment);
	}
	
	// MemberNickname을 가져오는 메서드 추가
	public String getMemberNickname(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("boardMapper.getMemberNickname", memberNo);
	}
}
