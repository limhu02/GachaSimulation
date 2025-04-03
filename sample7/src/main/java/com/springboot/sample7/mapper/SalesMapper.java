package com.springboot.sample7.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.sample7.model.Sale;
import com.springboot.sample7.model.SaleDetail;

@Mapper
public interface SalesMapper {
	int getMaxSaleId();
	void putSale(Sale sale);
	void putSaleDetail(SaleDetail saleDetail);

}
