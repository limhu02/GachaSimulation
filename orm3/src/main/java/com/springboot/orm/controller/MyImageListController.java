package com.springboot.orm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.orm.dao.ImageDao;
import com.springboot.orm.dao.UserDao;
import com.springboot.orm.model.Imagebbs_tbl;

@Controller
public class MyImageListController {
	@Autowired
	private UserDao userDao;
	@Autowired
	private ImageDao imageDao;
	
	@RequestMapping(value="/myimagelist/detail.html")
	public ModelAndView detail(Integer id) {//글번호(id)로 게시글 조회
		ModelAndView mav = new ModelAndView("myImagebbsDetail");
		Imagebbs_tbl bbs = this.imageDao.getImagebbs(id);
		mav.addObject("bbs",bbs);
		return mav;
	}
	
	@RequestMapping(value="/myimagelist/index.html")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("inputId");
		return mav;
	}
	@RequestMapping(value="/myimagelist/list.html")
	public ModelAndView list(String id, Integer page) {
		ModelAndView mav = new ModelAndView("myImagelist");
		List<Object[]> list = this.userDao.getImageList(id);
		int currentPage = 1;
		if(page != null) currentPage = page;
		int totalCount = list.size();//전체 글의 갯수
		System.out.println("전체 글의 갯수:"+totalCount);
		int pageCount = totalCount / 5;//페이지 수
		if(totalCount % 5 != 0) pageCount++;
		int startRow = (currentPage - 1) * 5;//0
		int endRow = ((currentPage - 1) * 5) + 5;//5
		if(endRow > totalCount) endRow = totalCount;
		List<Object[]> imageList = list.subList(startRow, endRow);
		//startRow 에서 endRow - 1 까지의 데이터를 imageList에 저장한다.
		mav.addObject("pageCount",pageCount);
		mav.addObject("list",imageList);
		return mav;
	}
	
}










