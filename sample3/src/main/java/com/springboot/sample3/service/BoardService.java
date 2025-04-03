package com.springboot.sample3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.sample3.mapper.BoardMapper;
import com.springboot.sample3.model.FreeBoard;

@Service
public class BoardService {
	@Autowired
	private BoardMapper boardMapper;
	
	public List<FreeBoard>getBoards(){
		return this.boardMapper.getBoards();
	}
	public FreeBoard getBoardDetail(int id) {
		return this.boardMapper.getBoardDetail(id);
	}

}
