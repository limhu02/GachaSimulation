package com.springboot.sample3.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.sample3.model.FreeBoard;

@Mapper
public interface BoardMapper {
	List<FreeBoard> getBoards(); 
	FreeBoard getBoardDetail(int id);

}
