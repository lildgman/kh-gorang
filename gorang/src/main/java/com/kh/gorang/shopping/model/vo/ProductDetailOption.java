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
	private Boolean mainDetailOption;
	private String detailOptionName;
	private int detailOptionOriginPrice;
	private int detailOptionSaledPrice;
	private int detailOptionQuantity;
	private String status;

}
