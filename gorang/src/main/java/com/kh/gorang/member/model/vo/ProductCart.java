package com.kh.gorang.member.model.vo;

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
}
