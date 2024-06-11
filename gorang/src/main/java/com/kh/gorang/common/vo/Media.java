package com.kh.gorang.common.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

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
public class Media {
	private int mediaNo;
	private int mediaType;
	private int mediaKind;
	private String filePath;
	private Date uploadDate;
	private String originName;
	private String changeName;
	private int boardNo;
	private int recipeNo;
	private int productNo;
	
	private String updateMediaStatus;
}
