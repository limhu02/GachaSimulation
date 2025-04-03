package com.springboot.myhome.dao;

import java.util.List;

public interface SalesDao {
	List<Object[]> getSales(String id);//계정으로 매출정보 검색
}
