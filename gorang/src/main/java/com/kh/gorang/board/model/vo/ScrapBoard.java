package com.kh.gorang.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ScrapBoard {
	private final int memberNo;
	private final int boardNo;
	private final String status;
	private final Date scrapDate;
}
