package com.springboot.sample7.service;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.sample7.model.Cart;
import com.springboot.sample7.model.GuailSet;
import com.springboot.sample7.model.Sale;
import com.springboot.sample7.model.SaleDetail;
import com.springboot.sample7.model.User;

@Service
public class Shop {
	@Autowired
	private SalesService salesService;

	public Integer calculateTotal(List<GuailSet> itemList) {
		int totalAmount = 0;//총액이 저장될 변수 선언
		for(GuailSet itemSet : itemList) {
			int price = itemSet.getItem().getPrice();//상품의 가격을 추출
			int quantity = itemSet.getQuantity();//상품의 갯수를 추출
			totalAmount = totalAmount + (price * quantity);//총합을 누적한다.
		}
		return totalAmount;
	}
	
	
	public void checkout(User user, Cart cart) {
		Sale sale = createSale(user, cart);//Sale을 생성하고 Sale안에 SaleDetail을  N개 넣는다.
		entrySale(sale);//Sale과 SaleDetail을 DB에 삽입한다.
	}
	private void entrySale(Sale sale) {
		this.salesService.putSale(sale);;//Sale을 이용해서 매출n정보 테이블에 삽입
		
		List<SaleDetail> saleDetailList = sale.getSaleDetailList();//Sale에서 SaleDetail을 가져온다.
		System.out.println(saleDetailList.get(0).getSaleId());
		for(SaleDetail saleDetail : saleDetailList) {
			this.salesService.putSaleDetail(saleDetail);;//SaleDetail을 이용해서 매출상세정보 테이블에 삽입
		}
	}
	private Sale createSale(User user, Cart cart) {
		Sale sale = new Sale();//매출 객체 생성
		sale.setSaleId(getNewSaleId());//매출번호 설정
		sale.setUser(user);//구매자 설정
		sale.setUserId(user.getUserId());//구매자 계정 설정
		Timestamp currentTime = getCurrentTime();//구매한 연월일시분초 생성
		sale.setSaleTime(currentTime);//구매 시간을 설정
		List<GuailSet> itemList = cart.getItemList();//장바구니에서 상품목록을 추출
		for(int i=0 ; i < itemList.size(); i++) {
			GuailSet itemSet = (GuailSet)itemList.get(i);//i번째 상품과 갯수(GuailSet)을 추출
			int saleDetailId = i + 1;//매출 상세 번호 생성
			SaleDetail saleDetail = createSaleDetail(sale, saleDetailId, itemSet, currentTime);
			sale.addSaleDetail(saleDetail);//매출(Sale)에 매출상세정보(SaleDetail) 추가
		}//모든 상품이 처리될때까지 반복
		return sale;
	}
	private SaleDetail createSaleDetail(Sale sale, int saleDetailId, GuailSet itemSet,
			Timestamp currentTime) {
		return new SaleDetail(sale, saleDetailId, itemSet, currentTime);
	}
	private Timestamp getCurrentTime() {
		return new Timestamp(Calendar.getInstance().getTimeInMillis());
	}
	private Integer getNewSaleId() {
		Integer id = this.salesService.getMaxSaleId()+1;//매출번호 생성
		return id;
	}
}
