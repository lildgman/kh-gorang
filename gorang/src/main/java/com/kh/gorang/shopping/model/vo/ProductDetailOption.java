package com.kh.gorang.shopping.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ProductDetailOption {
	
	private int detailOptionNo;
	private String detailOptionName;
	private int detailOptionPrice;
	private int detailOptionQuantity;
	private String status;
}
