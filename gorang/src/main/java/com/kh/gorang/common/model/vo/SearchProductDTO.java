package com.kh.gorang.common.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
public class SearchProductDTO {

	private int productNo;
	private String productName;
	private String productBrand;
	private int normalPrice;
	private int salePrice;
	private int discount;
	private String productImg;
}
