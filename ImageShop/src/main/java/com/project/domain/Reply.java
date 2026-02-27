package com.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Reply {
	private int replyNo;
	private int userNo;
	private Integer boardNo;
	private String content;
	private Date regDate;
	
	private Board board;
	private Member member;
	
}
