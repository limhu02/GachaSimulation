package com.springboot.sample7.model;

public class GuailSet {
	private Guail item;//과일상품 객체
	private Integer quantity;//갯수

	public Guail getItem() {	return item;	}
	public void setItem(Guail item) {	this.item = item;	}
	public Integer getQuantity() {	return quantity;	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public void addQuantity(Integer addQuantity) {
		this.setQuantity(this.getQuantity() + addQuantity);
	}//상품의 갯수 추가 메서드
	
	public GuailSet(Guail item, Integer quantity) {
		this.item = item; this.quantity = quantity;
	}//생성자
}



