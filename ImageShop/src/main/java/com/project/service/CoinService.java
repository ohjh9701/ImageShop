package com.project.service;

import java.util.List;

import com.project.domain.ChargeCoin;
import com.project.domain.Member;

public interface CoinService {

	public int charge(ChargeCoin chargeCoin) throws Exception;

	public List<ChargeCoin> list(Member member) throws Exception;

}
