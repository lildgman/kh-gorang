package com.kh.gorang.common.model.vo;

import lombok.Data;

@Data
public class SearchBoardDTO {
	private final int boardNo;
	private final String boardThumbnail;
	private final String boardTitle;
	private final String memberProfileImg;
	private final String memberNickname;
	private final int scrapCount;
	private final int viewCount;
	private final int likeCount;
}
