package com.kh.gorang.shopping.service;

import com.kh.gorang.shopping.model.vo.ProductInsertDTO;

public interface ODGProductService {

	// 상품 추가 메서드
	int insertProduct(ProductInsertDTO productDTO);

	// 전체 상품개수 조회 메서드
	int selectAllProductQuantity();

	// 판매중인 상품개수 조회
	int selectSaleProductQuantity();

	// 일시품절인 상품개수 조회
	int selectShortageProductQuantity();

	// 판매중지된 상품 개수 조회
	int selectSuspendedProductQuantity();

}
