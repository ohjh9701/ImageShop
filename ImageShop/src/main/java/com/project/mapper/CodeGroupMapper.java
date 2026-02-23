package com.project.mapper;

import java.util.List;

import com.project.domain.CodeGroup;

public interface CodeGroupMapper {

	public int create(CodeGroup codeGroup) throws Exception;
	
	//코드그룹 목록 페이지 요청
	public List<CodeGroup> list() throws Exception;
	
	//코드그룹 상세 페이지 요청
	public CodeGroup read(CodeGroup codeGroup) throws Exception;

	public int remove(CodeGroup codeGroup) throws Exception;

	public int modify(CodeGroup codeGroup) throws Exception;

}
