package com.kh.gorang.shopping.service;

import org.springframework.stereotype.Service;

import com.kh.gorang.shopping.model.vo.Product;
import com.kh.gorang.shopping.model.vo.ProductDetailOption;

public interface ProductService {

	int insertProduct(Product product, ProductDetailOption productOption);
	
}
