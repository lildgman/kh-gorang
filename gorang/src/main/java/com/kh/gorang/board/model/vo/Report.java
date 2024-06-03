package com.kh.gorang.board.model.vo;

import lombok.Data;

@Data
public class Report {
	
	private int reportNo;
	private String reportReason;
	private String reportContent;
	private int boardNo;
	private int memberNo;
}
