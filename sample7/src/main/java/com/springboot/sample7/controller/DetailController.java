package com.springboot.sample7.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.sample7.model.Guail;
import com.springboot.sample7.service.MyService;

@Controller
public class DetailController {
	@Autowired
	private MyService myService;

	@GetMapping(value = "/detail/detail")
	public ModelAndView detail(@RequestParam("itemId") int itemId) {
		ModelAndView mav = new ModelAndView("detail/detail");
		Guail item = this.myService.getGuail(itemId);
		mav.addObject("item",item);
		return mav;
	}
}
