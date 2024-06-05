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
	private int OrderPdoptNo;
	private int refProductNo;
	private int optQuantity;
}
