package com.kh.gorang.shopping.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.gorang.shopping.model.vo.Product;
import com.kh.gorang.shopping.model.vo.ProductDetailOption;

public interface ProductService {

	// 상품 등록
	int insertProduct(Product product, ProductDetailOption productOption);

	
	// 가장 많이 팔린 상품 4가지 조회
	ArrayList<Product> selectBestSellerList();

	// 최근 입고된 상품 4가지 조회
	ArrayList<Product> selectRecentProductList();


	Product selectProductByProductNo(int productNo);
	
}
