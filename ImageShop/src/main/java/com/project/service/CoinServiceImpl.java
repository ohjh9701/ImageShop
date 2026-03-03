package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.ChargeCoin;
import com.project.domain.Member;
import com.project.mapper.CoinMapper;

@Service
public class CoinServiceImpl implements CoinService {
	
	@Autowired 
	private CoinMapper mapper;

	@Override
	public int charge(ChargeCoin chargeCoin) throws Exception {
		 int count = mapper.charge(chargeCoin);
		 
		 if(count != 0) {
			count = mapper.create(chargeCoin);
		 }
		 return count;
	}

	@Override
	public List<ChargeCoin> list(Member member) throws Exception {
		return mapper.list(member);
	}
}
