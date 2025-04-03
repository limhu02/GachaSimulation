package com.springboot.sample4.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.sample4.model.Guail;
import com.springboot.sample4.service.GuailService;

@Controller
public class GuailController {
	@Autowired
	private GuailService guailService;
	
	@GetMapping(value = "/guaillist")
	public ModelAndView guailList() {
		ModelAndView mav= new ModelAndView("index");
		List<Guail> guailList = this.guailService.findAll();
		mav.addObject("guailList",guailList);
		return mav;
	}
	@GetMapping(value = "/detail/{id}")
	public ModelAndView detail(@PathVariable int id) {
		ModelAndView mav = new ModelAndView ("detail");
		Guail gauil = this.guailService.getGuail(id);
		mav.addObject("item",gauil);
		return mav;
	}

}
