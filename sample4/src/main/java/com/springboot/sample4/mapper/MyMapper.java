package com.springboot.sample4.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.sample4.model.Guail;
@Mapper
public interface MyMapper {
	List<Guail> findAll();
	Guail getGuail(int id);

}
