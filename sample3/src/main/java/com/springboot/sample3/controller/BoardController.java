package com.springboot.sample3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.sample3.model.FreeBoard;
import com.springboot.sample3.service.BoardService;

@Controller
public class BoardController {
	@Autowired 
	private BoardService boardService;
	
	@GetMapping(value ="/detail/{id}")
	public ModelAndView detail(@PathVariable int id) {
		ModelAndView mav = new ModelAndView("detail");
		FreeBoard board = this.boardService.getBoardDetail(id);
		mav.addObject("BOARD",board);
		return mav;
	}
	
	@GetMapping(value = "/freelist")
	public ModelAndView freeList()
	{
		ModelAndView mav = new ModelAndView("boardList");
		List<FreeBoard> boardList = this.boardService.getBoards();
		mav.addObject("boardList",boardList);
		return mav;
	}
}
