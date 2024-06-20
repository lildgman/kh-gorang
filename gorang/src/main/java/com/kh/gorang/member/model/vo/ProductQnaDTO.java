package com.kh.gorang.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductQnaDTO {
	private int qnaNo;
	private String qnaContent;
	private Date qnaCreateDate;
	private String status;
	private int productNo;
	private String productName;
	private String productBrand;
	private String productImg;
	private Integer refQnaNo;
	private String optionName;
}
