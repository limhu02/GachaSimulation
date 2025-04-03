package com.springboot.sample5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.sample5.model.User;
import com.springboot.sample5.service.UserService;
import com.springboot.sample5.utils.LoginValidator;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private LoginValidator loginValidator;
	
	@GetMapping(value = "/login")
	public ModelAndView loginForm() {
		ModelAndView mav= new ModelAndView();
		mav.addObject(new User());
		return mav;
	}
	
	@PostMapping(value = "/login")
	public ModelAndView login(User user, BindingResult br) {
		this.loginValidator.validate(user, br);
		ModelAndView mav =new ModelAndView("login");
		if(br.hasErrors()) {
			mav.getModel().putAll(br.getModel());
		}
		return mav;
	}
	
	@GetMapping(value = "/userentry")
	public ModelAndView form() {
		ModelAndView mav = new ModelAndView("userEntry");
		mav.addObject(new User());
		return mav;
	}
	@PostMapping(value = "/userentry")
	public ModelAndView register(User user, BindingResult br) {
		this.loginValidator.validate(user, br);
		ModelAndView mav= new ModelAndView("userEntry");
		if(br.hasErrors()) {
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		this.userService.putUser(user);
		mav.setViewName("userEntrySuccess");
		mav.addObject("user",user);
		return mav;
	}

}
