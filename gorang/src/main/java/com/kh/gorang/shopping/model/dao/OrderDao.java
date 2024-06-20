package com.kh.gorang.shopping.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.common.model.vo.PageInfo;
import com.kh.gorang.shopping.model.vo.Order;
import com.kh.gorang.shopping.model.vo.OrderPdopt;

@Repository
public class OrderDao {

	public int insertOrder(SqlSessionTemplate sqlSession, Order orderInfo) {
		return sqlSession.insert("orderMapper.insertOrder", orderInfo);
	}

	public int insertOrderPdoptList(SqlSessionTemplate sqlSession, List<OrderPdopt> orderOpts) {
		int result = 1;
		for(OrderPdopt orderOpt : orderOpts) {
			result *= sqlSession.insert("orderMapper.insertOrderPdoptList", orderOpt);
		}
		return result;
	}
	
	// 주문한 옵션 객체 list 조회
	public ArrayList<OrderPdopt> selectOrderPdOptsByMemberNo(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("orderMapper.selectOrderPdOptsByMemberNo", memberNo, rowBounds);
	}

	public int getOrderPdOptsCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("orderMapper.getOrderPdOptsCount", memberNo);
	}
}
