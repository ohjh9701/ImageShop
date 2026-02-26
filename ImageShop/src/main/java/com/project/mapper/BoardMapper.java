package com.project.mapper;

import java.util.List;

import com.project.common.domain.PageRequest;
import com.project.domain.Board;

public interface BoardMapper {

	//게시판 등록
	public int create(Board board) throws Exception;

	//게시판 리스트 조회
	//public List<Board> list() throws Exception;

	//게시판 상세 조회
	public Board read(Board board) throws Exception;

	//게시판 수정
	public int update(Board board) throws Exception;

	//게시판 삭제
	public int delete(Board board) throws Exception;
	
	//페이징 카운트
	public int count() throws Exception;
	
	//현재 페이지 리스트 출력
	public List<Board> list(PageRequest pageRequest) throws Exception;
	
}