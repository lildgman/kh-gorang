package com.kh.gorang.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class RefrigeratorInsertDTO {
	private int refNo;
	private int refMemberNo;
	private String refName;
	private int refKind;
	private String refThumbnail;
	private String refConsumptionDate;
	private int refCount;
	private String refInputDate;
	// 소비기한과 현 일시와의 차이를 저장하는 변수
	private long daysDifference;
}
