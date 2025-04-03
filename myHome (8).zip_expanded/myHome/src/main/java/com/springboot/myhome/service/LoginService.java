package com.springboot.myhome.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.myhome.mapper.LoginMapper;
import com.springboot.myhome.model.LoginUser;
import com.springboot.myhome.model.User;

@Service
public class LoginService {
	@Autowired
	private LoginMapper loginMapper;
	
	public User getUserInfo(String id) {
		return this.loginMapper.getUserInfo(id);
	}
	public void putUser(User user) {
		this.loginMapper.putUser(user);
	}
	public LoginUser getUser(LoginUser loginUser) {
		return this.loginMapper.getUser(loginUser);
	}
}
















