package com.kh.gorang.shopping.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

}
