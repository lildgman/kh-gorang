package com.kh.gorang.shopping.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.gorang.shopping.model.dao.OrderDao;
import com.kh.gorang.shopping.model.vo.Order;
import com.kh.gorang.shopping.model.vo.OrderPdopt;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	OrderDao orderDao;
	
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertOrder(Order orderInfo, List<OrderPdopt> orderOpts) {
		int result1 = orderDao.insertOrder(sqlSession, orderInfo);
		int result2 = 0;
		if(result1 > 0 ) {
			result2 = orderDao.insertOrderPdoptList(sqlSession, orderOpts);
		}
		return result1 * result2;
	}
	@Transactional(readOnly = true)
	@Override
	public ArrayList<OrderPdopt> selectOrderPdOptsByMemberNo(int memberNo) {	
		return orderDao.selectOrderPdOptsByMemberNo(sqlSession, memberNo);
	}

}
