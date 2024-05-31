package com.kh.gorang.shopping.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.shopping.model.vo.ProductDetailOption;
import com.kh.gorang.shopping.model.vo.ProductInsertDTO;

@Repository
public class EnrollProductDao {

	public int insertProduct(SqlSessionTemplate sqlSession, ProductInsertDTO productDTO) {
		return sqlSession.insert("enrollProductMapper.insertProduct",productDTO);
	}

	public int insertProductOption(SqlSessionTemplate sqlSession, List<ProductDetailOption> detailOptionList) {
		return sqlSession.insert("enrollProductMapper.insertProductOptions", detailOptionList);
	}

}
