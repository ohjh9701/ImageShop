package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.Item;
import com.project.domain.Member;
import com.project.domain.PayCoin;
import com.project.domain.UserItem;
import com.project.mapper.CoinMapper;
import com.project.mapper.UserItemMapper;

@Service
public class UserItemServiceImpl implements UserItemService {
	
	@Autowired 
	private UserItemMapper mapper; 
	 
	@Autowired 
	private CoinMapper coinMapper;

	@Override
	@Transactional
	public int register(Member member, Item item) throws Exception { 
		int userNo = member.getUserNo(); 
		 
		int itemId = item.getItemId(); 
		int price = item.getPrice(); 
		String itemName = item.getItemName();
		
		UserItem userItem = new UserItem(); 
		userItem.setUserNo(userNo); 
		userItem.setItemId(itemId); 
		 
		PayCoin payCoin = new PayCoin(); 
		payCoin.setUserNo(userNo); 
		payCoin.setItemId(itemId); 
		payCoin.setItemName(itemName);
		payCoin.setAmount(price); 
		 
		coinMapper.pay(payCoin); // 코인 지급 
		coinMapper.createPayHistory(payCoin); // 구매 내역 등록 
		 
		return mapper.create(userItem);
	}
	
	@Override
	public UserItem read(UserItem userItem) throws Exception {
		return mapper.read(userItem);
	}

	@Override
	public List<UserItem> list(Member member) throws Exception {
		return mapper.list(member);
	}
	
}
