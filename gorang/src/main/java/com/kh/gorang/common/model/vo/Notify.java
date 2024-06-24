package com.kh.gorang.common.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@ToString
public class Notify {
	private int notifyNo;
	private boolean notifyIsRead;
	private int notifyType;
	private String notifyContent;
	private Date notifyCreateAt;
	private int notifyMemberNo;
}
