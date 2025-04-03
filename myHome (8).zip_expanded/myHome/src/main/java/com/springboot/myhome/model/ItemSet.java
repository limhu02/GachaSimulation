package com.springboot.myhome.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ItemSet {
	private Item item;//상품
	private Integer quantity;//갯수
	
	public ItemSet(Item item, Integer quantity) {
		this.item = item; this.quantity = quantity;
	}//생성자

}
