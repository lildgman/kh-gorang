package com.kh.gorang.shopping.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	// ajax 상품 조회 
	@Override
	public ArrayList<Product> ajaxSearchProduct(String searchProductName) {
		return odgProductDao.ajaxSearchProduct(sqlSession, searchProductName);
	}

	// ajax 상품 옵션 조회 
	@Override
	public ArrayList<ProductDetailOption> ajaxSearchProductOption(int productNo) {
		
		return odgProductDao.ajaxSearchProductOption(sqlSession, productNo);
	}

	// ajax 상품 상태 변경
	@Override
	public int ajaxUpdateProductStatus(int productNo) {
		Product product = odgProductDao.selectProduct(sqlSession, productNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("productNo",productNo);
		map.put("status",product.getStatus());
			
		return odgProductDao.ajaxUpdateProductStatus(sqlSession, map);
	}
	
	// ajax 상품 옵션 변경
	@Override
	public int ajaxUpdateProductOptions(ArrayList<ProductDetailOption> productDetailOptions) {
		
		int result = 0;
		for(ProductDetailOption option : productDetailOptions) {
			result = odgProductDao.ajaxUpdateProductOption(sqlSession, option);
		}
		
		return result;
	}
}
