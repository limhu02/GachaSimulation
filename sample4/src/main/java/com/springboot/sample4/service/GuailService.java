package com.springboot.sample4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.sample4.mapper.MyMapper;
import com.springboot.sample4.model.Guail;

@Service
public class GuailService {
	@Autowired
	private MyMapper mymapper;
	
	public List<Guail> findAll(){
		return this.mymapper.findAll();
	}
	public Guail getGuail(int id) {
		return this.mymapper.getGuail(id);
	}

}
