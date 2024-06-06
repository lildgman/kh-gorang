package com.kh.gorang.member.model.vo;

import com.kh.gorang.shopping.model.vo.Product;
import com.kh.gorang.shopping.model.vo.ProductDetailOption;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ProductCart {
	private int memberNo;
	private int pdOptNo;
	private int pdOptQuantity;
	private String status;
	// vo 객체들
	private Product pdForCart;
	private ProductDetailOption pdOptForCart;
}
