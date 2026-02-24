package com.project.mapper;

import java.util.List;

import com.project.domain.CodeDetail;

public interface CodeDetailMapper {

	//등록 처리
	public int create(CodeDetail codeDetail) throws Exception;

	public int getMaxSortSeq(String groupCode) throws Exception;

	//목록 조회
	public List<CodeDetail> list() throws Exception;

	//상세 조회
	public CodeDetail read(CodeDetail codeDetail) throws Exception;

	//삭제 처리
	public int delete(CodeDetail codeDetail) throws Exception;
	
	//수정 처리
	public int update(CodeDetail codeDetail) throws Exception;

}
