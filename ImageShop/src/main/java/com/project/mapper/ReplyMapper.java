package com.project.mapper;

import java.util.List;

import com.project.domain.Board;
import com.project.domain.Reply;

public interface ReplyMapper {

	public int replyRegister(Reply reply) throws Exception;

	public List<Reply> list(Board board) throws Exception;

}
