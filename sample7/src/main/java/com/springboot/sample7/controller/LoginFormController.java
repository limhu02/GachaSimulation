package com.springboot.sample7.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.servlet.ModelAndView;

import com.springboot.sample7.model.User;
import com.springboot.sample7.service.MyService;
import com.springboot.sample7.utils.LoginValidator;
import com.springboot.sample7.utils.NamesStorage;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginFormController {
	@Autowired
	private MyService myService;

	@Autowired
	private LoginValidator loginValidator;
	@ModelAttribute
	public User setUp() {
		return new User();
	}
	
	@GetMapping(value = "/loginform/login.html")
	public String loginForm() {
		
		return "loginform/login";
	}
	@PostMapping(value = "/loginform/login.html")
	public ModelAndView toLogin(User user, BindingResult br, HttpSession session) {
		this.loginValidator.validate(user, br);
		ModelAndView mav = new ModelAndView();
		if(br.hasErrors()) {
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		try {
			User loginUser = this.myService.getUser(user);
			if(loginUser != null) {//조회결과가 존재 즉,로그인 성공한 경우
				mav.setViewName("loginform/loginSuccess");
				mav.addObject("loginUser",loginUser);
				session.setAttribute(NamesStorage.LOGIN_KEY, loginUser);
				return mav;
			}else {//조회결과가 존재하지 않음 즉,로그인 실패한 경우
				br.reject("error.login.user");//에러 메세지 출력
				mav.getModel().putAll(br.getModel());
				return mav;
			}
		}catch(EmptyResultDataAccessException e) {
			br.reject("error.login.user");//에러 메세지 출력
			mav.getModel().putAll(br.getModel());
			return mav;
		}
	}
}
