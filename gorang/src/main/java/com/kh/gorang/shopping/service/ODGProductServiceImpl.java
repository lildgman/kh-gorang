package com.kh.gorang.shopping.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.gorang.shopping.model.dao.ODGProductDao;
import com.kh.gorang.shopping.model.vo.Product;
import com.kh.gorang.shopping.model.vo.ProductDetailOption;
import com.kh.gorang.shopping.model.vo.ProductInsertDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ODGProductServiceImpl implements ODGProductService {
	
	private final ODGProductDao odgProductDao;
	private final SqlSessionTemplate sqlSession;

	// 상품 추가
	@Override
	@Transactional
	public int insertProduct(ProductInsertDTO productDTO) {
		
		List<ProductDetailOption> detailOptionList = productDTO.getOptions();
		// 상품 등록 후 -> 상품 옵션들 등록
		int result1 = odgProductDao.insertProduct(sqlSession, productDTO);
		int result2 = 0;
		if (result1 > 0) {
			result2 = odgProductDao.insertProductOption(sqlSession, detailOptionList);
		}
		return result1 * result2;
	}
	
	// 전체 상품 개수 조회
	@Override
	public int selectAllProductQuantity() {
		return odgProductDao.selectAllProductQuantity(sqlSession);
	}

	// 판매중인 상품 개수 조회
	@Override
	public int selectSaleProductQuantity() {
		return odgProductDao.selectSaleProductQuantity(sqlSession);
	}

	// 일시품절된 상품 개수 조회
	@Override
	public int selectShortageProductQuantity() {
		return odgProductDao.selectShortageProductQuantity(sqlSession);
	}

	// 판매중지된 상품 개수 조회
	@Override
	public int selectSuspendedProductQuantity() {
		return odgProductDao.selectSuspendedProductQuantity(sqlSession);
	}

	@Override
	public ArrayList<Product> ajaxSearchProduct(String searchProductName) {
		return odgProductDao.ajaxSearchProduct(sqlSession, searchProductName);
	}

	@Override
	public ArrayList<ProductDetailOption> ajaxSearchProductOption(String productNo) {
		ArrayList<ProductDetailOption> list = odgProductDao.ajaxSearchProductOption(sqlSession, productNo);
		log.info("list={}",list);
		return null;
	}
}
