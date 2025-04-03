package com.springboot.sample7.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.servlet.ModelAndView;

import com.springboot.sample7.exception.CartEmptyException;
import com.springboot.sample7.exception.LoginRequiredException;
import com.springboot.sample7.model.Cart;
import com.springboot.sample7.model.GuailSet;
import com.springboot.sample7.model.User;
import com.springboot.sample7.service.Shop;
import com.springboot.sample7.utils.NamesStorage;

import jakarta.servlet.http.HttpSession;
@Controller
public class CheckOutController {
	@ExceptionHandler
	public String loginEmpty(LoginRequiredException ex) {
		return "dummyLogin";
	}
	@ExceptionHandler
	public String cartEmpty(CartEmptyException ex) {
		return "cartEmpty";
	}
	@Autowired
	private Shop shop;

	@GetMapping(value = "/checkout/checkout.html")
	public ModelAndView checkout(HttpSession session) {
		User user = (User)session.getAttribute(NamesStorage.LOGIN_KEY);//세션에서 계정을 찾는다.
		if(user == null) {
			throw new LoginRequiredException("로그인 되어있지 않습니다.");
		}//로그인을 하지 않고 계산하러 가기를 누른 경우
		Cart cart = (Cart)session.getAttribute(NamesStorage.CART_KEY);//세션에서 장바구니를 찾는다.
		if(cart == null || cart.isEmpty()) {
			throw new CartEmptyException("카트가 비어있습니다.");
		}//장바구니가 없거나 비어있는 상태에서 계산하러 가기를 누른 경우
		ModelAndView mav = new ModelAndView("checkout/checkout");
		List<GuailSet> itemList = cart.getItemList();
		Integer totalAmount = this.shop.calculateTotal(itemList);
		mav.addObject("itemList",itemList);//장바구니에 있는 상품의 목록을 저장
		mav.addObject("totalAmount", totalAmount);//장바구니에 있는 상품의 총액을 저장
		return mav;
	}
}
