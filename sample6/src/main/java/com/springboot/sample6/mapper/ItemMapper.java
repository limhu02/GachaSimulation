package com.springboot.sample6.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.sample6.model.Item;
import com.springboot.sample6.model.Nation;

@Mapper
public interface ItemMapper {
 void putItems(Item item);
 	List<Nation> getNations();
 	Item getItem(String code);
}
