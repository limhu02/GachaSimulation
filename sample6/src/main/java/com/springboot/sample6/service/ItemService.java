package com.springboot.sample6.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.sample6.mapper.ItemMapper;
import com.springboot.sample6.model.Item;
import com.springboot.sample6.model.Nation;

@Service
public class ItemService {

	@Autowired
	private ItemMapper itemMapper;
	public void putItems(Item item) {
		this.itemMapper.putItems(item);
	}
	public List<Nation> getNations() {
		return this.itemMapper.getNations();
	}
	public Item getItem(String code) {
		return this.itemMapper.getItem(code);
	}
}
