package com.kh.gorang.shopping.service;

import com.kh.gorang.shopping.model.vo.ProductInsertDTO;

public interface EnrollProductService {

	// 상품 추가 메서드
	int insertProduct(ProductInsertDTO productDTO);

}
