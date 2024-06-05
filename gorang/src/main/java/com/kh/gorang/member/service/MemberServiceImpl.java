package com.kh.gorang.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gorang.member.model.dao.MemberDao;
import com.kh.gorang.member.model.vo.Member;
import com.kh.gorang.member.model.vo.ProductCart;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession; // 기존의 myBaits SqlSession객체 대체
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public Member loginMember(Member m) {
		// SqlSessionTemplate bean등록 후 @Autowired했음
		// 스프링이 사용 후 자동으로 반납시켜주기 때문에 clse메소드로 자원반납 할 필요가 없음
		//한줄로 기술이 가능
			
		return memberDao.loginMember(sqlSession, m);
	}

	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}

	@Override
	public int nameCheck(String checkName) {
		return memberDao.nameCheck(sqlSession, checkName);
	}
	
	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(sqlSession, m);
	}

	@Override
	public Member selectMemberByEmail(String email) {
		return memberDao.selectMemberByEmail(sqlSession, email);
	}

	@Override
	public int insertProductCart(int memberNo, List<ProductCart> pdCarts) {
		return memberDao.insertProductCart(sqlSession, memberNo, pdCarts);
	}

	

	

}
