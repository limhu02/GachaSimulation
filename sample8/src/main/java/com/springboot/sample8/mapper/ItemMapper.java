package com.springboot.sample8.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.sample8.model.Item;

@Mapper
public interface ItemMapper {
	List<Item> getItemList();
	Item getItem(int id);
	void deleteItem(int id);
	void putItem(Item item);
	void updateItem(Item item);
	List<Item>findItem(String name);

}
