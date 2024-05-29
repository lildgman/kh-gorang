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
public class Member {
	private int memberNo;
	private	String memberEmail;
	private	String memberPwd;
	private	String nickname;
	private String memberPhone;
	private String gender;
	private String memberAddress;
	private Date birth;
	private String profile;
	private String grade;
	private Date memberEnrollDate;
	private Date memberModifyDate;
	private String memberStatus;
	private String alarm;
	private String loginPath;
}

