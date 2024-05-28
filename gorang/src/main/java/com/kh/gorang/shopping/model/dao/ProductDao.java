package com.kh.gorang.shopping.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.shopping.model.vo.Product;
import com.kh.gorang.shopping.model.vo.ProductDetailOption;

@Repository
public class ProductDao {

	public int insertProduct(SqlSessionTemplate sqlSession, Product product) {
		return sqlSession.insert("productMapper.insertProduct", product);
		
	}

	public int insertProductDetailOption(SqlSessionTemplate sqlSession, ProductDetailOption productOption) {
		return sqlSession.insert("productMapper.insertProductDetailOption",productOption);
	}

}
