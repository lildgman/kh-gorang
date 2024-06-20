package com.kh.gorang.shopping.model.dto;

import lombok.Data;

@Data
public class ScrapBoardDTO {
	
	private int productNo;
	private int memberNo;
	
	public ScrapBoardDTO(int productNo, int memberNo) {
		this.productNo = productNo;
		this.memberNo = memberNo;
		
	}
}
