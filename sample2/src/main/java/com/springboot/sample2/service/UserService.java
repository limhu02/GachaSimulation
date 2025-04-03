package com.springboot.sample2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.sample2.mapper.UserMapper;
import com.springboot.sample2.model.User_info;

@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;
	public List<User_info>getUsers(){
		return this.userMapper.getUsers();
	}
	public User_info getUserDetail(String id) {
		return this.userMapper.getUserDetail(id);
	}

}
