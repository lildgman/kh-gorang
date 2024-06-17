package com.kh.gorang.board.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class InsertCommentDTO {
	private int memberNo;
	private int boardNo;
	private String commentContent;
	private int refCommentNo;
}
