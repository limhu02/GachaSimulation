package com.springboot.sample7.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.sample7.model.Guail;
import com.springboot.sample7.service.MyService;

@Controller
public class IndexController {
	@Autowired
	private MyService myservice;
	
	@GetMapping(value = "/index/index.html")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("index/index");
		List<Guail> guailList = this.myservice.getGuailList();
		mav.addObject("guailList",guailList);
		return mav;
	}

}
