package com.kh.gorang.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductQnaDTO {
	private final String qnaContent;
	private final Date qnaCreateDate;
	private final String status;
	private final int productNo;
	private final String productName;
	private final String productBrand;
	private final String productImg;
	private final int refQnaNo;
	private final String optionName;
}
