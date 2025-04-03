package com.springboot.sample8.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.sample8.mapper.ItemMapper;
import com.springboot.sample8.model.Item;

@Service
public class ItemService {
	@Autowired
	private ItemMapper itemMapper;
	
	public List<Item> getItemList(){return this.itemMapper.getItemList();}
	public Item getItem(int id) {return this.itemMapper.getItem(id);}
	public void deleteItem(int id) {this.itemMapper.deleteItem(id);}
	public void putItem(Item item) {this.itemMapper.putItem(item);}
	public void updateItem(Item item) {this.itemMapper.updateItem(item);}
	public List<Item> findItem(String name){return this.itemMapper.findItem(name);}

}
