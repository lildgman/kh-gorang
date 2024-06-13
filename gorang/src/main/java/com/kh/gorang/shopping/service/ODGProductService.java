package com.kh.gorang.shopping.service;

import java.util.ArrayList;

import com.kh.gorang.common.model.vo.PageInfo;
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
	ArrayList<Product> ajaxSearchProduct(PageInfo pi, String searchProductName);

	// 상품 옵션 검색
	ArrayList<ProductDetailOption> ajaxSearchProductOption(int productNo);

	// 상품 상태 변경 
	int ajaxUpdateProductStatus(int productNo);

	// 상품 옵션 변경 
	int ajaxUpdateProductOptions(ArrayList<ProductDetailOption> productDetailOptions);

	// 검색한 상품 개수 조회
	int getSearchProductResultCount(String searchProductName);

}
