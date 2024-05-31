package com.kh.gorang.shopping.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.gorang.common.vo.PageInfo;
import com.kh.gorang.member.model.vo.Member;
import com.kh.gorang.member.model.vo.QnA;
import com.kh.gorang.member.model.vo.Review;
import com.kh.gorang.shopping.model.dao.ProductDao;
import com.kh.gorang.shopping.model.vo.Product;
import com.kh.gorang.shopping.model.vo.ProductDetailOption;
import com.kh.gorang.shopping.model.vo.ProductInsertDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService{

	private final ProductDao productDao;
	private final SqlSessionTemplate sqlSession;
	
	@Override
	public int insertProduct(ProductInsertDTO product) {

		List<ProductDetailOption> detailOptions = product.getOptions();
		List<Integer> optionNoList = new ArrayList<Integer>();		
		
		int productNo = productDao.insertProduct(sqlSession, product);
		
		for(ProductDetailOption detailOption : detailOptions) {
			int optionNo = productDao.insertDetailOptions(sqlSession, detailOption);
			optionNoList.add(optionNo);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNo",productNo);
		map.put("optionNoList",optionNoList);
		
		return productDao.insertOptions(sqlSession, map);
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

	@Override
	public Product selectProductByProductNo(int productNo) {
		return productDao.selectProductByProductNo(sqlSession, productNo);
	}

	@Override
	public ArrayList<Review> selectProductReviewsByPno(int productNo) {
		return productDao.selectProductReviewsByPno(sqlSession, productNo);
	}


	@Override
	public ArrayList<QnA> selectProductQnAsByPno(int productNo) {
		return productDao.selectProductQnAsByPno(sqlSession, productNo);
	}



	public int selectAllProductQuantity() {
		return productDao.selectAllProductQuanity(sqlSession);
	}



	@Override
	public int selectSaleProductQuantity() {
		return 0;
	}

}
