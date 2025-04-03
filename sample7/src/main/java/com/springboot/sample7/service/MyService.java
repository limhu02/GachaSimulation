package com.springboot.sample7.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.sample7.mapper.MyMapper;
import com.springboot.sample7.model.Guail;
import com.springboot.sample7.model.User;

@Service
public class MyService {
	@Autowired
	private MyMapper myMapper;
	
	public Guail getGuail(int id) {return this.myMapper.getGuail(id);}
	public List<Guail> getGuailList(){return this.myMapper.getGuailList();}
	public void putUser(User user) {this.myMapper.putUser(user);}
	public User getUser(User user) {return this.myMapper.getUser(user);}
	public List<User>getUserList(){return this.myMapper.getUserList();}
	public User getUserById(String id) {return this.myMapper.getUserById(id);}

}
