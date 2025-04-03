package com.springboot.myhome.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.myhome.model.Cart;
import com.springboot.myhome.model.LoginUser;
import com.springboot.myhome.model.User;
import com.springboot.myhome.service.ItemService;
import com.springboot.myhome.service.LoginService;
import com.springboot.myhome.service.ShopService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class EndController {
	@Autowired
	private LoginService loginService;
	@Autowired
	private ItemService itemService;
	@Autowired
	private ShopService shopService;
	
	@GetMapping(value="/end/end.html")
	public ModelAndView end(HttpSession session, 
			HttpServletResponse response) throws IOException{
		LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");//세션에서 사용자를 찾음
		//User user = this.userDao.getUserInfo(loginUser.getId());//계정으로 사용자정보 검색
		User user = this.loginService.getUserInfo(loginUser.getId());
		if(loginUser == null) {
		//throw new LoginRequiredException("로그인 되어있지 않습니다.");
		}
		Cart cart = (Cart)session.getAttribute("CART");//세션에서 장바구니를 찾음
		if(cart == null || cart.getCodeList().isEmpty()) {
		//throw new CartEmptyException("카트가 비어있습니다.");
		}
		//this.shop.checkout(user, cart);//매출정보와 매출상세정보테이블에 매출정보를 삽입한다.
		this.shopService.checkout(user, cart);
		cart.clearAll();//장바구니를 비운다.
		//this.itemDao.deleteCart(user.getUser_id());//계정에 해당하는 장바구니 테이블 삭제
		this.itemService.deleteCart(user.getUser_id());
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("BODY","end.jsp");
		return mav;
	}
	
}







