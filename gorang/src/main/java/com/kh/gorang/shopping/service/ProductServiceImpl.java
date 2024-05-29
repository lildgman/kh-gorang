package com.kh.gorang.shopping.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.gorang.common.vo.PageInfo;
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
		
		int insertProductResult =  productDao.insertProduct(sqlSession, product);
		int insertProductDetailResult = 0;
		if(insertProductResult > 0) {
			insertProductDetailResult = productDao.insertProductDetailOption(sqlSession, productOption);			
		}
		return insertProductResult*insertProductDetailResult;
	}
	
	@Override
	public int insertProduct(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return productDao.insertProduct(sqlSession, map);
	}


	@Override
	public ArrayList<Product> selectBestSellerList() {
		return productDao.selectBestSellerList(sqlSession);
	}

	@Override
	public ArrayList<Product> selectRecentProductList() {
		return productDao.selectRecentProductList(sqlSession);
	}


	@Override
	public int selectProductCount(Map<String, String> map) {
		return productDao.selectProductCount(sqlSession, map);
	}

	@Override
	public ArrayList<Product> selectResultProductList(PageInfo pi, Map<String, String> map) {
		log.info("----------------------------------------------------------}");
		return productDao.selectResultProductList(sqlSession, pi, map);
	}

	

	

}
