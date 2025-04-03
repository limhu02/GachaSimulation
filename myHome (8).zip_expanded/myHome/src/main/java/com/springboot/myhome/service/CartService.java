package com.springboot.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.myhome.mapper.CartMapper;
import com.springboot.myhome.model.CartItem;

@Service
public class CartService {
	@Autowired
	private CartMapper cartMapper;
	
	public List<CartItem> selectCart(String id) {
		return this.cartMapper.selectCart(id);
	}
	public void updateCart(CartItem cartItem) {
		this.cartMapper.updateCart(cartItem);
	}
	public void deleteCart(CartItem cartItem) {
		this.cartMapper.deleteCart(cartItem);
	}
	public void insertCart(CartItem cartItem) {
		this.cartMapper.insertCart(cartItem);
	}
}
















