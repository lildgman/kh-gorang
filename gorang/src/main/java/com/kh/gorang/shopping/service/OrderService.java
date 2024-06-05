package com.kh.gorang.shopping.service;

import java.util.List;

import com.kh.gorang.shopping.model.vo.Order;
import com.kh.gorang.shopping.model.vo.OrderPdopt;

public interface OrderService {
	
	// 주문 정보 저장
	int insertOrder(Order orderInfo, List<OrderPdopt> orderOpts);
}
