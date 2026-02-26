package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Board;
import com.project.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;

	@Override
	public int register(Board board) throws Exception {
		return mapper.create(board);
	}

	@Override
	public List<Board> list() throws Exception {
		return mapper.list();
	}

	@Override
	public Board read(Board board) throws Exception {
		return mapper.read(board);
	}

	@Override
	public int modify(Board board) throws Exception {
		return mapper.update(board);
	}
}