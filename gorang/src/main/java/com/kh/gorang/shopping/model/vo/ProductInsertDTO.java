package com.kh.gorang.shopping.model.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@ToString
public class ProductInsertDTO {
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
	private List<ProductDetailOption> options;
	
	public ProductInsertDTO() {
		super();
		
		options = new ArrayList<ProductDetailOption>();
	}
	
	
}
