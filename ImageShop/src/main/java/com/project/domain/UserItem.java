package com.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserItem {
	//사용자 구매 테이블
	private int userItemNo; 
	private int userNo; 
	private int itemId;
	private Date regDate;
	
	//구매한 상품 테이블
	private String itemName; 
	private Integer price; 
	private String description; 
	private String pictureUrl; 
	
}
