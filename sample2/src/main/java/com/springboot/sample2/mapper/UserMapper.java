package com.springboot.sample2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.sample2.model.User_info;

@Mapper
public interface UserMapper {
	List<User_info> getUsers();
	User_info getUserDetail(String id);

}
