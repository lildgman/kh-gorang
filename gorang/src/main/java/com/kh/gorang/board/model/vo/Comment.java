package com.kh.gorang.board.model.vo;

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
public class Comment {
    private int commentNo;
    private int boardNo;	
    private int memberNo; 
    private String commentContent;
    private Date commentDate;
}