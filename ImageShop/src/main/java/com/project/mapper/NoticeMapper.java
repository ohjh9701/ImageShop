package com.project.mapper;

import java.util.List;

import com.project.common.domain.PageRequest;
import com.project.domain.Notice;

public interface NoticeMapper {

	public int create(Notice notice) throws Exception;

	public List<Notice> list(PageRequest pageRequest) throws Exception;

	public int count(PageRequest pageRequest) throws Exception;

	public Notice read(Notice notice) throws Exception;

	public int update(Notice notice) throws Exception;

	public int delete(Notice notice) throws Exception;

}
