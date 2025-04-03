package com.springboot.sample5.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.sample5.mapper.UserMapper;
import com.springboot.sample5.model.User;

@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;
	
	public User getUser(User user) {
		return this.userMapper.getUser(user);
	}
	public void putUser(User user) {
		this.userMapper.putUser(user);
	}

}
