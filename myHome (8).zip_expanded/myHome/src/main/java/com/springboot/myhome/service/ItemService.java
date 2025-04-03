package com.springboot.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.myhome.mapper.ItemMapper;
import com.springboot.myhome.model.Item;
import com.springboot.myhome.model.Nation;
import com.springboot.myhome.model.StartEnd;

@Service
public class ItemService {
	@Autowired
	private ItemMapper itemMapper;
	
	public List<Item> getItemByName(String name, Integer pageNo){
		if(pageNo == null) pageNo = 1;
		int start = (pageNo - 1) * 5;
		int end = ((pageNo - 1) * 5) + 6;
		StartEnd se = new StartEnd();
		se.setStart(start); se.setEnd(end); se.setName(name);
		return this.itemMapper.getItemByName(se);
	}
	public Integer getItemCountByName(String name) {
		return this.itemMapper.getItemCountByName(name);
	}
	public void deleteCart(String id) {
		this.itemMapper.deleteCart(id);
	}
	public void updateItem(Item item) {
		this.itemMapper.updateItem(item);
	}
	public void deleteItem(String code) {
		this.itemMapper.deleteItem(code);
	}
	public Item getItem(String code) {
		return this.itemMapper.getItem(code);
	}
	public Integer getTotalItems() {
		return this.itemMapper.getTotalItems();
	}
	public List<Item> getItems(Integer pageNo){
		if(pageNo == null) pageNo = 1;
		int start = (pageNo - 1) * 5;
		int end = ((pageNo - 1) * 5) + 6;
		StartEnd se = new StartEnd();
		se.setStart(start); se.setEnd(end);
		return this.itemMapper.getItems(se);
	}
	public List<Nation> getNations(){
		return this.itemMapper.getNations();
	}
	public Integer getCodeDup(String code) {
		return this.itemMapper.getCodeDup(code);
	}
	public void putItems(Item item) {
		this.itemMapper.putItems(item);
	}
}

























