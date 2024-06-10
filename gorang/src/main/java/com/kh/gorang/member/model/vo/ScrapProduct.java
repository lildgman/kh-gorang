package com.kh.gorang.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ScrapProduct {
	private final int memberNo;
	private final int productNo;
	private final String status;
	private final Date scrapDate;
}
