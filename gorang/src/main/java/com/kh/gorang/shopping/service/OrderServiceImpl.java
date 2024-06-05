package com.kh.gorang.shopping.service;

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
		return orderDao.insertOrder(sqlSession, orderInfo)
				* orderDao.insertOrderPdoptList(sqlSession, orderOpts);
		
	}

}
