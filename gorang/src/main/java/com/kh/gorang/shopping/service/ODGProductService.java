package com.kh.gorang.shopping.service;

import java.util.ArrayList;

import com.kh.gorang.shopping.model.vo.Product;
import com.kh.gorang.shopping.model.vo.ProductDetailOption;
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

	// 상품검색
	ArrayList<Product> ajaxSearchProduct(String searchProductName);

	// 상품 옵션 검색
	ArrayList<ProductDetailOption> ajaxSearchProductOption(int productNo);

}
