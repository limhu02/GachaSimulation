package com.springboot.sample5.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.sample5.model.User;
@Mapper
public interface UserMapper {
	User getUser(User user);
	void putUser(User user);
}
