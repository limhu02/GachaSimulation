package com.springboot.myhome.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.myhome.model.LoginUser;
import com.springboot.myhome.model.User;

@Mapper
public interface LoginMapper {
	User getUserInfo(String id);
	void putUser(User user);
	LoginUser getUser(LoginUser loginUser);
}
