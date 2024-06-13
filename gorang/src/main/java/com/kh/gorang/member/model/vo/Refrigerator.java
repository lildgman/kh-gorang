package com.kh.gorang.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Refrigerator {
	// 냉장고 식재료 번호
	private int refNo;
	// 참조 회원 번호
	private int refMemberNo;
	// 냉장고 식재료명
	private String refName;
	// 썸네일
	private String refThumbnail;
	private int refFresh;
	private Date refConsumptionDate;
	private int refCount;
	private Date refInputDate;
}
