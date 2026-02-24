package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.mapper.CodeMapper;


@Service
public class CodeServiceImpl implements CodeService {
	
	@Autowired
	private CodeMapper mapper;

	
}
