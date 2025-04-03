package com.springboot.sample7.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.servlet.ModelAndView;

import com.springboot.sample7.model.User;
import com.springboot.sample7.service.MyService;
import com.springboot.sample7.utils.UserEntryValidator;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserEntryFormController {
	@Autowired 
	private MyService myService;
	@Autowired
	private MessageSource messageSource;
	@Autowired
	private UserEntryValidator userEntryValidator;
	
	@PostMapping(value = "/userentryform/userEntry.html")
	public ModelAndView toRegister(User user, BindingResult br, HttpSession session) {
		this.userEntryValidator.validate(user, br);//폼체크 진행
		ModelAndView mav = new ModelAndView();
		if(br.hasErrors()) {//폼체크에 문제가 있는 경우
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		try {
			this.myService.putUser(user);//DB에 insert
			session.setAttribute("loginUser", user);
			mav.setViewName("userentryform/userEntrySuccess");
			mav.addObject("user", user);
			return mav;
		}catch(DataIntegrityViolationException e) {
			br.reject("error.duplicate.user");//중복 계정인 경우 메세지 출력
			mav.getModel().putAll(br.getModel());
			return mav;
		}
	}
	
	@ModelAttribute
	public User setup() {
		User user = new User();
		MessageSourceAccessor msa = new MessageSourceAccessor(this.messageSource);
		user.setUserId(msa.getMessage("user.userId.default"));
		user.setAddress(msa.getMessage("user.userName.default"));
		return user;
	}
	
	@GetMapping(value = "/userentryform/userEntry.html")
	
	public String userEntryForm() {
		return "userentryform/userEntry";
	}
	
	

}
