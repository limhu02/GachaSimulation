package com.springboot.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.myhome.mapper.BoardMapper;
import com.springboot.myhome.model.Board;
import com.springboot.myhome.model.StartEnd;

@Service
public class BoardService {
	@Autowired
	private BoardMapper boardMapper;
	
	public Integer getMaxSeq() {
		Integer max = boardMapper.getMaxSeq();
		if(max == null) return 0;
		return max;
	}
	public Integer getTotalCount() {
		return boardMapper.getTotalCount();
	}
	public void updateBoard(Board board) {
		this.boardMapper.updateBoard(board);
	}
	public void deleteBoard(Integer seq) {
		this.boardMapper.deleteBoard(seq);
	}
	public Board getBoard(Integer no) {
		return this.boardMapper.getBoard(no);
	}
	public List<Board> getBoardList(Integer pageNo){
		if(pageNo == null) pageNo = 1;
		int start = (pageNo - 1) * 5;
		int end = ((pageNo - 1) * 5) + 6;
		StartEnd st = new StartEnd();
		st.setStart(start); st.setEnd(end);
		return this.boardMapper.getBoardList(st);
	}
	public void putBoard(Board board) {
		board.setSeq(this.getMaxSeq() + 1);//글번호설정
		this.boardMapper.putBoard(board);
	}
}




























