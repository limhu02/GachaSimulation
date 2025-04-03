package com.springboot.orm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.orm.dao.InnerjoinDao;

@Controller
public class InnerjoinController {
	@Autowired
	private InnerjoinDao innerjoinDao;
	
	@RequestMapping(value="/innerjoin/index.html")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("innerJoinResult");
		List<Object[]> list = this.innerjoinDao.getList();
		mav.addObject("list",list);
		return mav;
	}
}










