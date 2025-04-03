package com.springboot.myhome.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.myhome.model.Sale;
import com.springboot.myhome.model.SaleDetail;

@Mapper
public interface SalesMapper {
	Integer getMaxSaleId();
	void putSale(Sale sale);
	void putSaleDetail(SaleDetail detail);
}
