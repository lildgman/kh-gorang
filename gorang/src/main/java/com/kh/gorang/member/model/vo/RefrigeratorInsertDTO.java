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
	private String refThumbnail;
	private String refConsumptionDate;
	private int refCount;
	private String refInputDate;
}
