package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Board;
import com.project.domain.Reply;
import com.project.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyMapper mapper;

	@Override
	public int replyRegister(Reply reply) throws Exception {
		return mapper.replyRegister(reply);
	}

	@Override
	public List<Reply> list(Board board) throws Exception {
		return mapper.list(board);
	}
	
}
