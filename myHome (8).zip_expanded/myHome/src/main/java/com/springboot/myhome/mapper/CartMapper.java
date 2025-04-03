package com.springboot.myhome.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.myhome.model.CartItem;

@Mapper
public interface CartMapper {
	List<CartItem> selectCart(String id);
	void updateCart(CartItem cartItem);
	void deleteCart(CartItem cartItem);
	void insertCart(CartItem cartItem);
}
