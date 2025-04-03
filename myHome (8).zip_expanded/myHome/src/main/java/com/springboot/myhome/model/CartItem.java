package com.springboot.myhome.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartItem {
	private String id;//계정
	private String item_code;
	private String item_title;
	private int price;
	private String item_spec;
	private String reg_date;
	private String madin;//원산지국가 코드
	
	private int sum;//소계(상품코드 별 구매금액)
	private int num;//갯수(상품코드 별 갯수)
	
}//상품정보 DTO
