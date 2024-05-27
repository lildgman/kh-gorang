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
=======
	private String memberEmail; //이메일
	private String memberPwd; //비밀번호
	private String memberNickName;  //닉네임
	private String memberName; //이름
	private String memberPhone; //전화번호
	private char memberGender; //성별
	private String memberAddress; //주소
	private String memberBirth; //생년월일
	private String memberProfile; //프로필
	private String memberGrade; // 등급
	private Date memberEnrollDate; //가입일
	private Date memberModifyDate; //탈퇴일
	private char memberStatus; //탈퇴여부
	private char alarmStatus; //알람 상태
	private int loginSignPath; //로그인 경로
>>>>>>> 4214dde7e5f30bc74aec7571de4b44ed7cbbf123
}
