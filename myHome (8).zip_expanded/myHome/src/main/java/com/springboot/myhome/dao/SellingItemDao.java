package com.springboot.myhome.dao;

import com.springboot.myhome.model.SellingItem;

public interface SellingItemDao {
	SellingItem getItem(String code);
	//상품번호로 상품 조회
}
