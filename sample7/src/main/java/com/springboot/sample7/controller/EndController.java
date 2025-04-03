package com.springboot.sample7.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.sample7.exception.CartEmptyException;
import com.springboot.sample7.exception.LoginRequiredException;
import com.springboot.sample7.model.Cart;
import com.springboot.sample7.model.User;
import com.springboot.sample7.service.Shop;
import com.springboot.sample7.utils.NamesStorage;

import jakarta.servlet.http.HttpSession;

@Controller
public class EndController {
	@Autowired
	private Shop shop;
	
	@PostMapping(value="/end/end.html")
	public ModelAndView end(HttpSession session) {
		User loginUser = (User)session.getAttribute(NamesStorage.LOGIN_KEY);//세션에서 사용자를 찾음
		if(loginUser == null)
			throw new LoginRequiredException("로그인 되어있지 않습니다.");
		Cart cart = (Cart)session.getAttribute(NamesStorage.CART_KEY);//세션에서 장바구니를 찾음
		if(cart == null || cart.isEmpty())
			throw new CartEmptyException("카트가 비어있습니다.");
		this.shop.checkout(loginUser, cart);//매출정보와 매출상세정보테이블에 매출정보를 삽입한다.
		cart.clearAll();//장바구니를 비운다.
		ModelAndView mav = new ModelAndView("end/end");
		return mav;
	}
}
