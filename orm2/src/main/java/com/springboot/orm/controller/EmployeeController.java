package com.springboot.orm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.orm.dao.EmployeeDao;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeDao employeeDao;
	
	@GetMapping(value="/employee/index.html")
	public ModelAndView index() {
		ModelAndView mav= new ModelAndView("findEmp");
		return mav;
	}
	
	@PostMapping(value="/employee/index.html")
	public ModelAndView find(Integer id) {
		ModelAndView mav= new ModelAndView("empResult");
		List<Object[]> list = this.employeeDao.getList(id);
		if(list.size() == 0) mav.addObject("empList",null);
		else mav.addObject("empList",list);
		return mav;
	}
}

