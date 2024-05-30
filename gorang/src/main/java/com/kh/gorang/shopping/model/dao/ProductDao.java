package com.kh.gorang.shopping.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.common.vo.PageInfo;
import com.kh.gorang.shopping.model.vo.Product;
import com.kh.gorang.shopping.model.vo.ProductDetailOption;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ProductDao {

	// 상품 등록
	public int insertProduct(SqlSessionTemplate sqlSession, Product product) {
		return sqlSession.insert("productMapper.insertProduct", product);
		
	}
	
	public int insertProduct(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		int res = sqlSession.selectOne("productMapper.insertProduct", map);
		log.info("res : {}",res);
		return res;
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


	public int selectProductCount(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("productMapper.selectProductCount", map);
	}

	public ArrayList<Product> selectResultProductList(SqlSessionTemplate sqlSession, PageInfo pi,
			Map<String, String> map) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		log.info("map={}",map);
		log.info("pi={}",pi); 
		
		return (ArrayList)sqlSession.selectList("productMapper.selectResultProductList", map, rowBounds);
	}

	public Product selectProductByProductNo(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("productMapper.selectProductByProductNo", productNo);
	}


	

	

}
