package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.CodeDetail;
import com.project.mapper.CodeDetailMapper;


@Service
public class CodeDetailServiceImpl implements CodeDetailService {
	
	@Autowired
	private CodeDetailMapper mapper;

	@Override
	public int register(CodeDetail codeDetail) throws Exception {
		String groupCode = codeDetail.getGroupCode();
		// 그룹코드 정렬 순서의 최대값
		int maxSortSeq = mapper.getMaxSortSeq(groupCode);
		codeDetail.setSortSeq(maxSortSeq + 1);
		
		return mapper.create(codeDetail);
	}

	@Override
	public List<CodeDetail> list() throws Exception {
		return mapper.list();
	}

	
}
