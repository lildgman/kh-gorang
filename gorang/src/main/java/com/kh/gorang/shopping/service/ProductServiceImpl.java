package com.kh.gorang.shopping.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.gorang.shopping.model.dao.ProductDao;
import com.kh.gorang.shopping.model.vo.Product;
import com.kh.gorang.shopping.model.vo.ProductDetailOption;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService{

	private final ProductDao productDao;
	private final SqlSessionTemplate sqlSession;
	
	@Override
	public int insertProduct(Product product, ProductDetailOption productOption) {
		
		int result =  productDao.insertProduct(sqlSession, product);
		int result2 = 0;
		if(result > 0) {
			result2 = productDao.insertProductDetailOption(sqlSession, productOption);			
		}
		return result*result2;
	}

}
