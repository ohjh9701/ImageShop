package com.project.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Board {
	
	private int boardNo;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	
}