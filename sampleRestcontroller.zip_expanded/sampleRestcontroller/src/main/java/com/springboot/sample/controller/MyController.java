package com.springboot.sample.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.sample.model.UserData;

@RestController
public class MyController {
	
	@GetMapping(value="/showme")
	public UserData getdata() {
		UserData ud = new UserData();
		ud.setAddr("서울시 은평구"); ud.setName("황종선");
		ud.setTel("010-1234-4321");
		return ud;
	}
	
	@GetMapping(value="/ask")
	public String answer(Integer score) {
		String result = "";
		switch(score/10) {
		case 10: case 9: result = "A"; break;
		case 8: result = "B"; break;
		case 7: result = "C"; break;
		case 6: result = "D"; break;
		default : result = "F";
		}
		return result;
	}
}
