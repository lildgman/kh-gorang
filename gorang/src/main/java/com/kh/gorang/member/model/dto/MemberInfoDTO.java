package com.kh.gorang.member.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberInfoDTO {
	
	private int followingCount;
	// 팔로워 수
	private int followerCount;
	// 총 스크랩 수
	private int totalScrapCount;
	// 총 좋아요 개수
	private int totalLikeCount;
	
	public MemberInfoDTO(int followingCount, int followerCount, int totalScrapCount, int totalLikeCount) {
		super();
		this.followingCount = followingCount;
		this.followerCount = followerCount;
		this.totalScrapCount = totalScrapCount;
		this.totalLikeCount = totalLikeCount;
	}
}
