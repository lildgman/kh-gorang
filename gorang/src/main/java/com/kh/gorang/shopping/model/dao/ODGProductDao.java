package com.kh.gorang.shopping.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.shopping.model.vo.ProductDetailOption;
import com.kh.gorang.shopping.model.vo.ProductInsertDTO;

@Repository
public class ODGProductDao {

	// 상품 등록
	public int insertProduct(SqlSessionTemplate sqlSession, ProductInsertDTO productDTO) {
		return sqlSession.insert("odgProductMapper.insertProduct",productDTO);
	}

	// 상품 옵션 등록
	public int insertProductOption(SqlSessionTemplate sqlSession, List<ProductDetailOption> detailOptionList) {
		return sqlSession.insert("odgProductMapper.insertProductOptions", detailOptionList);
	}

	// 상품 전체 개수 조회
	public int selectAllProductQuantity(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("odgProductMapper.selectAllProductQuantity");
	}

	// 판매중인 상품 전체 개수 조회
	public int selectSaleProductQuantity(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("odgProductMapper.selectSaleProductQuantity");
	}

	// 일시품절된 상품개수 조회
	public int selectShortageProductQuantity(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("odgProductMapper.selectShortageProductQuantity");
	}

	// 판매 중지된 상품개수 조회
	public int selectSuspendedProductQuantity(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("odgProductMapper.selectSuspendedProductQuantity");
	}

}
