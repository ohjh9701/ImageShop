package com.project.service;

import java.util.List;

import com.project.common.domain.CodeLabelValue;

public interface CodeService {

	
	//코드라벨 등록 처리요청
	
	//코드라벨 목록(리스트) 페이지 요청
	public List<CodeLabelValue> getCodeGroupList() throws Exception;

	public List<CodeLabelValue> getCodeList(String groupCode) throws Exception;
	
	//코드라벨 상세 페이지 요청
	
	//코드라벨 삭제 처리요청
	
	//코드라벨 수정 처리요청

}
