package com.kh.gorang.shopping.model.vo;

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
public class Product {
	
	private int productNo;
	private String category;
	private String productName;
	private String productBrand;
	private int normalPrice;
	private int salePrice;
	private int discountPercent;
	private String mainImg;
	private String description;
	private String shipmentType;
	private int shipmentTime;
	private int shippingPrice;
	private String status;
}
