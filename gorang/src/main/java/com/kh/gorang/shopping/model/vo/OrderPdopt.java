package com.kh.gorang.shopping.model.vo;

import java.sql.Date;

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
public class OrderPdopt {
	private int optNo;
	private int refOrderNo;
	private int optQuantity;
	// 구매내역에 뿌려주기 위해 필요한 속성
	private int orderPdNo;
	private Date orderPdOptDate;
	// 옵션명
	private String orderPdOptName;
	// 옵션 가격(할인된 가격)
	private int orderPdOptPrice;
	// 상품명
	private String orderPdName;
	private String orderPdBrand;
	private String orderPdThumbnail;
	private int orderPdShipmentTime;
	
}
