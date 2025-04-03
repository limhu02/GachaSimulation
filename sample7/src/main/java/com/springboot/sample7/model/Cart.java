package com.springboot.sample7.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<GuailSet> itemList = new ArrayList<GuailSet>();
	public List<GuailSet> getItemList(){
		return itemList;
	}//변수 itemList의 게터 메서드
	public boolean isEmpty() {
		if(this.itemList == null || this.itemList.isEmpty()) return true;
		else return false;
	}//장바구니가 비어있는지 확인하는 메서드(비어있으면 true, 비어있지 않으면 false)
	public void clearAll() {
		this.itemList = new ArrayList<GuailSet>();//새 ArrayList를 생성
	}//장바구니를 비우는 메서드
	public void add(GuailSet pushedGuailSet) {
		boolean itemExistInCart = false;//이미 장바구니에 담긴 물건인지 검사용 변수(true:이미있슴,false:없슴)
		Guail pushedItem = pushedGuailSet.getItem();//장바구니에 담을 물건을 수신
		int pushedItemId = pushedItem.getSeqno();//장바구니에 담을 물건의 상품번호 수신
		for(GuailSet cartItemSet : this.itemList) {
			Guail cartItem = cartItemSet.getItem();//장바구니에서 물건을 수신
			int cartItemId = cartItem.getSeqno();//장바구니에 담긴 물건의 번호
			if(pushedItemId == cartItemId) {
				cartItemSet.addQuantity(pushedGuailSet.getQuantity());//상품의 갯수 증가
				itemExistInCart = true;//이미 장바구니에 담긴 물건임을 설정
				break;//반복을 종료
			}//장바구니에 담긴 물건의 번호와 장바구니에 담을 물건의 번호가 동일한 경우
		}//현재 장바구니에 담긴 GuailSet을 반복해서 검사한다.
		if( ! itemExistInCart) this.itemList.add(pushedGuailSet);//장바구니에 추가
	}//itemList에 상품과 갯수(GuailSet)를 넣는 메서드
}













