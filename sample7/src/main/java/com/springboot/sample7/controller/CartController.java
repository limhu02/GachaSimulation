package com.springboot.sample7.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.servlet.ModelAndView;

import com.springboot.sample7.exception.LoginRequiredException;
import com.springboot.sample7.model.Cart;
import com.springboot.sample7.model.Guail;
import com.springboot.sample7.model.GuailSet;
import com.springboot.sample7.model.User;
import com.springboot.sample7.service.MyService;
import com.springboot.sample7.utils.NamesStorage;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	@Autowired
	private MyService myservice;
	@ExceptionHandler
	public String loginEmpty(LoginRequiredException ex) {
		return "dummyLogin";
	}

	@GetMapping(value="/cart/cartAdd.html")
	public ModelAndView add(Integer itemId, Integer quantity, HttpSession session) {
		User user = (User)session.getAttribute(NamesStorage.LOGIN_KEY);
		if(user == null) {//로그인을 안 한 경우
			throw new LoginRequiredException("로그인 되어있지 않습니다.");//예외를 발생시켜서 페이지를 전환한다.
		}
		//1. itemId에 있는 과일상품번호로 과일정보를 DB에서 찾는다.
		Guail item = this.myservice.getGuail(itemId);
		//2. 세션에서 장바구니(Cart)를 찾는다. 없으면, 장바구니를 생성한다.
		Cart cart = (Cart)session.getAttribute(NamesStorage.CART_KEY);
		if(cart == null) cart = new Cart();
		cart.add(new GuailSet(item, quantity));
		session.setAttribute(NamesStorage.CART_KEY, cart);//장바구니는 세션에 저장한다.
		session.setAttribute(NamesStorage.GUAIL_KEY, item);//장바구니에 담은 상품을 세션에 저장
		session.setAttribute(NamesStorage.NUMBER, quantity);//장바구니에 담은 상품의 갯수를 세션 저장
		ModelAndView mav = new ModelAndView("redirect:/cart/result.html");
		return mav;
	}
	@GetMapping(value="/cart/result.html")
	public ModelAndView reload(HttpSession session) {
		Guail item = (Guail)session.getAttribute(NamesStorage.GUAIL_KEY);
		Integer quantity = (Integer)session.getAttribute(NamesStorage.NUMBER);
		String msg = item.getTitle()+"을(를) "+quantity+"개 카트에 담았습니다.";
		ModelAndView mav = new ModelAndView("cart/cart");
		Cart cart = (Cart)session.getAttribute(NamesStorage.CART_KEY);
		mav.addObject("cart", cart);
		mav.addObject("message", msg);
		return mav;
	}
	@GetMapping(value="/cart/cartConfirm.html")
	public ModelAndView confirm(HttpSession session) {
		Cart cart = (Cart)session.getAttribute(NamesStorage.CART_KEY);//세션에서 장바구니를 찾는다.
		if(cart == null) cart = new Cart();
		session.setAttribute(NamesStorage.CART_KEY, cart);//세션에 장바구니를 저장한다.
		ModelAndView mav = new ModelAndView("cart/cart");
		mav.addObject("cart", cart);
		return mav;
	}
	
	@GetMapping(value="/cart/cartClear.html")
	public ModelAndView clear(HttpSession session) {
		Cart cart = (Cart)session.getAttribute(NamesStorage.CART_KEY);//세션에서 장바구니를 찾는다.
		if(cart == null) cart = new Cart();
		cart.clearAll();
		session.setAttribute(NamesStorage.CART_KEY, cart);//세션에 장바구니를 저장한다.
		ModelAndView mav = new ModelAndView("cart/cart");
		mav.addObject("message","카트를 비웠습니다.");
		return mav;
	}
}
