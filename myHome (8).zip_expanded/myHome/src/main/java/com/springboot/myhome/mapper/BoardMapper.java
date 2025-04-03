package com.springboot.myhome.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.myhome.model.Board;
import com.springboot.myhome.model.StartEnd;

@Mapper
public interface BoardMapper {
	Integer getMaxSeq();
	Integer getTotalCount();
	void updateBoard(Board board);
	void deleteBoard(Integer seq);
	Board getBoard(Integer no);
	
	List<Board> getBoardList(StartEnd se);
	void putBoard(Board board);
}













