package com.springboot.myhome.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.myhome.model.User;

@Controller
public class EntryController {

	@GetMapping(value="/entry/userEntry.html")
	public ModelAndView userEntry() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject(new User());//인스턴스 주입
		mav.addObject("BODY","userEntry.jsp");
		return mav;
	}
	
}
