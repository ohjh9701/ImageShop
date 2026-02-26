package com.project.service;

import java.util.List;

import com.project.domain.Board;

public interface BoardService {

	
	//게시판 등록
	public int register(Board board) throws Exception;

	//게시판 리스트 조회
	public List<Board> list() throws Exception;

	//게시판 상세 조회
	public Board read(Board board) throws Exception;

	//게시판 수정
	public int modify(Board board) throws Exception;
	
	
	//게시판 삭제
	
}