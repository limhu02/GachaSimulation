package com.springboot.sample2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.sample2.model.User_info;
import com.springboot.sample2.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@GetMapping(value = "/userdetail/{id}")
	public ModelAndView userDetail(@PathVariable String id) {
		ModelAndView mav= new ModelAndView("userDetail");
		User_info detail = this.userService.getUserDetail(id);
		mav.addObject("user",detail);
		return mav;
	}
	
	@GetMapping(value = "/userlist")
	public ModelAndView userList() {
		ModelAndView mav = new ModelAndView("userList");
		List<User_info> userList = this.userService.getUsers();
		mav.addObject("userList",userList);
		return mav;
	}

}
