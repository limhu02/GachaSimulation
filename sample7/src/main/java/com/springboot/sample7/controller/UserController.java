package com.springboot.sample7.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.sample7.model.User;
import com.springboot.sample7.service.MyService;

@Controller
public class UserController {
	@Autowired
	private MyService myService;
	
	@GetMapping(value = "/userlist/userList.html")
	public ModelAndView userList() {
		ModelAndView mav =new ModelAndView("userlist/userList");
		List<User> userList = this.myService.getUserList();
		mav.addObject("userList",userList);
		return mav;
	}
	
	@GetMapping(value="/userlist/userDetail.html")
	public ModelAndView userDetail(@RequestParam("id")String id) {
		ModelAndView mav = new ModelAndView ("userlist/userDetail");
		User user = this.myService.getUserById(id);
		mav.addObject(user);
		return mav;
	}

}
