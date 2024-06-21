package com.kh.gorang.shopping.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.gorang.common.model.vo.PageInfo;
import com.kh.gorang.shopping.model.vo.Order;
import com.kh.gorang.shopping.model.vo.OrderPdopt;

public interface OrderService {
	
	// 주문 정보 저장
	int insertOrder(Order orderInfo, List<OrderPdopt> orderOpts);

	ArrayList<OrderPdopt> selectOrderPdOptsByMemberNo(int memberNo, PageInfo pi);

	int getOrderPdOptsCount(int userNo);
	
	
}
