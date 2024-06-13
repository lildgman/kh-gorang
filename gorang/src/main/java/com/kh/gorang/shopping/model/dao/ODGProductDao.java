package com.kh.gorang.shopping.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.common.model.vo.PageInfo;
import com.kh.gorang.shopping.model.vo.Product;
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

	// 상품 검색
	public ArrayList<Product> ajaxSearchProduct(SqlSessionTemplate sqlSession, PageInfo pi, String searchProductName) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("odgProductMapper.ajaxSearchProduct", searchProductName, rowBounds);
	}

	// 상품 옵션 조회
	public ArrayList<ProductDetailOption> ajaxSearchProductOption(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("odgProductMapper.ajaxSearchProductOption",productNo);
		
	}

	// 상품 상태 변경
	public int ajaxUpdateProductStatus(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("odgProductMapper.ajaxUpdateProductStatus", map);
	}

	public Product selectProduct(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("odgProductMapper.selectProduct", productNo);
	}

	public int ajaxUpdateProductOption(SqlSessionTemplate sqlSession, ProductDetailOption option) {
		return sqlSession.update("odgProductMapper.ajaxUpdateProductOptions", option);
	}

	// 상품 검색 결과 개수 조회
	public int getSearchProductResultCount(SqlSessionTemplate sqlSession, String searchProductName) {
		return sqlSession.selectOne("odgProductMapper.selectSearchProductCount", searchProductName);
	}

}
