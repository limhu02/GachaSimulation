package com.springboot.myhome.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.myhome.dao.MyInformationDao;
import com.springboot.myhome.dao.SalesDao;
import com.springboot.myhome.dao.SellingItemDao;
import com.springboot.myhome.model.LoginUser;
import com.springboot.myhome.model.SellingItem;
import com.springboot.myhome.model.User_info;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MypageController {
	@Autowired
	private MyInformationDao myInformationDao;
	@Autowired
	private SalesDao salesDao;
	@Autowired
	private SellingItemDao sellingItemDao;
	
	@GetMapping(value="/mypage/itemdetail.html")
	public ModelAndView itemdetail(String id) {
		ModelAndView mav = new ModelAndView("index");
		SellingItem item = this.sellingItemDao.getItem(id);//상품번호로 상품조회
		mav.addObject("BODY","mypageItemDetail.jsp");
		mav.addObject(item);
		return mav;
	}
	
	@GetMapping(value="/mypage/history.html")
	public ModelAndView history(HttpSession session) {
		LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");
		String id = loginUser.getId();//계정을 찾는다.
		ModelAndView mav = new ModelAndView("index");
		List<Object[]> salesList = this.salesDao.getSales(id);//계정으로 매출정보 검색
		mav.addObject("BODY","salesHistory.jsp");
		mav.addObject("sales",salesList);
		return mav;
	}
	
	@PostMapping(value="/mypage/modify.html")
	public ModelAndView modify(@Valid User_info user_info, BindingResult br) {
		ModelAndView mav = new ModelAndView("index");
		if(br.hasErrors()) {
			mav.addObject("BODY","myInfo.jsp");
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		this.myInformationDao.updateMyInfomation(user_info);//가입자 정보 수정
		User_info userInfo = this.myInformationDao.getUser(user_info.getUser_id());
		//변경된 가입자 정보를 검색한다.
		mav.addObject("BODY","myInfoUpdateResult.jsp");
		mav.addObject(userInfo);
		return mav;
	}
	
	@GetMapping(value="/mypage/myinformation.html")
	public ModelAndView mypage(HttpSession session) {
		LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");
		ModelAndView mav = new ModelAndView("index");
		User_info mypage = this.myInformationDao.getUser(loginUser.getId());
		mav.addObject("BODY","myInfo.jsp");
		mav.addObject(mypage);
		return mav;
	}//정보 수정하기를 클릭한 경우
	
	@GetMapping(value="/mypage/index.html")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("BODY","mypage.jsp");
		return mav;
	}
	
}
