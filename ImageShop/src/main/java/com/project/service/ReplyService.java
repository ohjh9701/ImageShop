package com.project.service;

import java.util.List;

import com.project.domain.Board;
import com.project.domain.Reply;

public interface ReplyService {

	public int replyRegister(Reply reply) throws Exception;

	public List<Reply> list(Board board) throws Exception;

	public void delete(Reply reply)throws Exception;

	public void modify(Reply reply)throws Exception;

}
