package com.springboot.myhome.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.myhome.model.Item;
import com.springboot.myhome.model.Nation;
import com.springboot.myhome.model.StartEnd;

@Mapper
public interface ItemMapper {
	List<Item> getItemByName(StartEnd se);
	Integer getItemCountByName(String name);
	void deleteCart(String id);
	void updateItem(Item item);
	void deleteItem(String code);
	Item getItem(String code);
	Integer getTotalItems();
	List<Item> getItems(StartEnd se);
	List<Nation> getNations();
	Integer getCodeDup(String code);
	void putItems(Item item);
}





















