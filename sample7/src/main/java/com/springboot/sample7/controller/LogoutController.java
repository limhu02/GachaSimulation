package com.springboot.sample7.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
public class LogoutController {
	@GetMapping(value = "/logout/logout.html")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();//세션을 비활성화 한다.
		ModelAndView mav = new ModelAndView("logout/logout");
		//ModelAndView에 뷰이름이 없으므로 브라우저의 url에서 뷰이름을 찾는다. 즉, logout/logout
		return mav;
	}

}
