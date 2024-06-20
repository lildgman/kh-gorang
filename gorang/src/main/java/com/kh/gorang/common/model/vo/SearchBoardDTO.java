package com.kh.gorang.common.model.vo;

import lombok.Data;

@Data
public class SearchBoardDTO {
	private int boardNo;
	private String boardThumbnail;
	private String boardTitle;
	private String memberProfileImg;
	private String memberNickname;
	private int scrapCount;
	private int viewCount;
	private int likeCount;
}
