package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.common.domain.PageRequest;
import com.project.domain.Notice;
import com.project.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeMapper mapper;

	@Override
	@Transactional
	public int register(Notice notice) throws Exception {
		return mapper.create(notice);
	}

	@Override
	public List<Notice> list(PageRequest pageRequest) throws Exception {
		return mapper.list(pageRequest);
	}

	@Override
	public int count(PageRequest pageRequest) throws Exception {
		return mapper.count(pageRequest);
	}

	@Override
	public Notice read(Notice notice) throws Exception {
		return mapper.read(notice);
	}

	@Override
	@Transactional
	public int modify(Notice notice) throws Exception {
		return mapper.update(notice);
	}

	@Override
	@Transactional
	public int remove(Notice notice) throws Exception {
		return mapper.delete(notice);
	}
	
}
