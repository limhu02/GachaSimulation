package com.springboot.sample7.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.sample7.mapper.SalesMapper;
import com.springboot.sample7.model.Sale;
import com.springboot.sample7.model.SaleDetail;

@Service
public class SalesService {
	@Autowired
	private SalesMapper salesMapper;

	int getMaxSaleId() {return this.salesMapper.getMaxSaleId();}
	void putSale(Sale sale) {this.salesMapper.putSale(sale);}
	void putSaleDetail(SaleDetail saleDetail) {this.salesMapper.putSaleDetail(saleDetail);}


}
