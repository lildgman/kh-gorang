package com.kh.gorang.shopping.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.shopping.model.vo.Product;
import com.kh.gorang.shopping.model.vo.ProductDetailOption;

@Repository
public class ProductDao {

	// 상품 등록
	public int insertProduct(SqlSessionTemplate sqlSession, Product product) {
		return sqlSession.insert("productMapper.insertProduct", product);
		
	}

	// 상품 옵션 등록
	public int insertProductDetailOption(SqlSessionTemplate sqlSession, ProductDetailOption productOption) {
		return sqlSession.insert("productMapper.insertProductDetailOption",productOption);
	}

	// 가장 많이 팔린 상품 4가지 조회
	public ArrayList<Product> selectBestSellerList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.selectBestSellerList");
	}

	public ArrayList<Product> selectRecentProductList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.selectRecentProductList");
	}

}
