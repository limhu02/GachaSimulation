package com.springboot.orm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.orm.dao.LeftouterjoinDao;

@Controller
public class LeftouterjoinController {
	@Autowired
	private LeftouterjoinDao leftouterjoinDao;
	
	@GetMapping(value="/leftouterjoin/index.html")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("leftOuterJoinResult");
		List<Object[]> list = this.leftouterjoinDao.getList();
		mav.addObject("list",list);
		return mav;
	}
}















