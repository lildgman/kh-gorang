package com.kh.gorang.board.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardListDTO {
	private int boardNo;
	private String boardThumbnail;
	private String boardTitle;
	private String boardWriterProfileImg;
	private String boardWriterNickname;
	private int scrapCount;
	private int viewCount;
	private int likeCount;
}
