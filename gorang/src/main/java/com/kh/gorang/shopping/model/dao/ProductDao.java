package com.kh.gorang.shopping.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorang.common.vo.PageInfo;
import com.kh.gorang.member.model.vo.Member;
import com.kh.gorang.member.model.vo.QnA;
import com.kh.gorang.member.model.vo.Review;
import com.kh.gorang.shopping.model.vo.Product;
import com.kh.gorang.shopping.model.vo.ProductDetailOption;
import com.kh.gorang.shopping.model.vo.ProductInsertDTO;

import lombok.extern.slf4j.Slf4j;

@Repository
public class ProductDao {

	public int insertProduct(SqlSessionTemplate sqlSession, ProductInsertDTO product) {
		// TODO Auto-generated method stub

		Product resultProduct = sqlSession.selectOne("productMapper.insertProduct",product);
		return resultProduct.getProductNo();
	}
	
	public int insertDetailOptions(SqlSessionTemplate sqlSession, ProductDetailOption detailOption) {
		ProductDetailOption result = sqlSession.selectOne("productMapper.insertDetailOption",detailOption);
		return result.getDetailOptionNo();
	}
	
	public int insertOptions(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.insert("productMapper.insertOptions",map);
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
		
		return (ArrayList)sqlSession.selectList("productMapper.selectResultProductList", map, rowBounds);
	}

	public Product selectProductByProductNo(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("productMapper.selectProductByProductNo", productNo);
	}

	public ArrayList<Review> selectProductReviewsByPno(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("productMapper.selectProductReviewsByPno", productNo);
	}


	public ArrayList<QnA> selectProductQnAsByPno(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("productMapper.selectProductQnAsByPno", productNo);
	}



	public int selectAllProductQuanity(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("productMapper.selectAllProductQuantity");
		
	}

	public ArrayList<ProductDetailOption> selectProductOptsByPno(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("productMapper.selectProductOptsByPno", productNo);
	}


	public int insertProductQna(SqlSessionTemplate sqlSession, QnA q) {
		return sqlSession.insert("productMapper.insertProductQna", q);
	}
}