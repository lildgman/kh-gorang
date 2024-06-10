package com.kh.gorang.shopping.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.gorang.common.vo.PageInfo;
import com.kh.gorang.member.model.vo.QnA;
import com.kh.gorang.member.model.vo.Review;
import com.kh.gorang.shopping.model.vo.Product;
import com.kh.gorang.shopping.model.vo.ProductDetailOption;
import com.kh.gorang.shopping.model.vo.ProductInsertDTO;

public interface ProductService {

	// 상품 등록
	int insertProduct(ProductInsertDTO product);
	
	// 가장 많이 팔린 상품 4가지 조회
	ArrayList<Product> selectBestSellerList();

	// 최근 입고된 상품 4가지 조회
	ArrayList<Product> selectRecentProductList();

	// 상품 개수 조회
	int selectProductCount(Map<String, String> map);
	ArrayList<Product> selectResultProductList(PageInfo pi, Map<String, String> map);
	
	// 상품 번호로 상품 조회
	Product selectProductByProductNo(int productNo);
	
	// 상품 번호로 상품의 리뷰들 조회
	ArrayList<Review> selectProductReviewsByPno(int productNo);


	// 상품 번호로 상품 문의들 조회
	ArrayList<QnA> selectProductQnAsByPno(int productNo);

	// 상품 전체 조회
	int selectAllProductQuantity();

	int selectSaleProductQuantity();
	
	//상품 옵션 조회
	ArrayList<ProductDetailOption> selectProductOptsByPno(int productNo);
	
	//상품 문의 등록
	int insertProductQna(QnA q);
}
