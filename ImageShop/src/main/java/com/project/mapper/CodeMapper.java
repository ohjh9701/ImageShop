package com.project.mapper;

import java.util.List;

import com.project.common.domain.CodeLabelValue;

public interface CodeMapper {

	//등록 처리
	
	//목록 조회
	public List<CodeLabelValue> getCodeGroupList() throws Exception;

	public List<CodeLabelValue> getCodeList(String groupCode) throws Exception;
	
	//상세 조회
	
	//삭제 처리
	
	//수정 처리
	

}
