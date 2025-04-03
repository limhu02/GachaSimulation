package com.springboot.orm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.orm.dao.InnerjoinfetchDao;
import com.springboot.orm.model.User;

@Controller
public class InnerjoinfetchController {
	@Autowired
	private InnerjoinfetchDao innerjoinfetchDao;
	
	@GetMapping(value="/innerjoinfetch/index.html")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("innerJoinFetchResult");
		List<User> list = this.innerjoinfetchDao.getList();
		mav.addObject("list",list);
		return mav;
	}
}










