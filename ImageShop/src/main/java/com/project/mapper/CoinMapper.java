package com.project.mapper;

import java.util.List;

import com.project.domain.ChargeCoin;
import com.project.domain.Member;

public interface CoinMapper {

	public int charge(ChargeCoin chargeCoin) throws Exception;

	public List<ChargeCoin> list(Member member) throws Exception;

	public int create(ChargeCoin chargeCoin) throws Exception;

}
