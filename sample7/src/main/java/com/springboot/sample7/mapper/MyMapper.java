package com.springboot.sample7.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.sample7.model.Guail;
import com.springboot.sample7.model.User;

@Mapper
public interface MyMapper {

	Guail getGuail(int id);
	List<Guail> getGuailList();
	void putUser(User user);
	User getUser(User user);
	List<User>getUserList();
	User getUserById(String id);
}
