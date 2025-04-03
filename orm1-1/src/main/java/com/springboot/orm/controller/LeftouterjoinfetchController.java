package com.springboot.orm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.orm.dao.LeftouterjoinfetchDao;
import com.springboot.orm.model.User;

@Controller
public class LeftouterjoinfetchController {
	@Autowired
	private LeftouterjoinfetchDao leftouterjoinfetchDao;
	
	@GetMapping(value="/leftouterjoinfetch/index.html")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("leftOuterJoinFetchResult");
		List<User> list = this.leftouterjoinfetchDao.getList();
		mav.addObject("list",list);
		return mav;
	}
}











