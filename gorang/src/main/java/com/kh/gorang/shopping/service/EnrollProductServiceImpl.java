package com.kh.gorang.shopping.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.gorang.shopping.model.dao.EnrollProductDao;
import com.kh.gorang.shopping.model.vo.ProductDetailOption;
import com.kh.gorang.shopping.model.vo.ProductInsertDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class EnrollProductServiceImpl implements EnrollProductService {
	
	private final EnrollProductDao enrollProductDao;
	private final SqlSessionTemplate sqlSession;

	@Override
	@Transactional
	public int insertProduct(ProductInsertDTO productDTO) {
		
		List<ProductDetailOption> detailOptionList = productDTO.getOptions();
		// 상품 등록 후 -> 상품 옵션들 등록
		int result1 = enrollProductDao.insertProduct(sqlSession, productDTO);
		int result2 = 0;
		if (result1 > 0) {
			result2 = enrollProductDao.insertProductOption(sqlSession, detailOptionList);
		}
		return result1 * result2;
	}
}
