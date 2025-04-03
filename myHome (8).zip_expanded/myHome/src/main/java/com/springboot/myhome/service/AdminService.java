package com.springboot.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.myhome.admin.OrderModify;
import com.springboot.myhome.admin.SalesInfoById;
import com.springboot.myhome.mapper.AdminMapper;
import com.springboot.myhome.model.StartEnd;
import com.springboot.myhome.model.User;

@Service
public class AdminService {
	@Autowired
	private AdminMapper adminMapper;
	
	public void updateMember(User user) {
		this.adminMapper.updateMember(user);
	}
	public User findMemberById(String id) {
		return this.adminMapper.findMemberById(id);
	}
	public Integer findMemberCount(User user) {
		return this.adminMapper.findMemberCount(user);
	}
	public List<User> findMember(User user){
		return this.adminMapper.findMember(user);
	}
	public List<OrderModify> getOrdersByState(Integer pageNo, Integer state){
		if(pageNo == null) pageNo = 1;
		int start = (pageNo - 1) * 5;
		int end = ((pageNo - 1) * 5) + 6;
		StartEnd se = new StartEnd();
		se.setStart(start); se.setEnd(end); se.setState(state);
		return this.adminMapper.getOrdersByState(se);
	}
	public Integer getOrdersByStateCount(Integer state) {
		return this.adminMapper.getOrdersByStateCount(state);
	}
	public Integer getTotalOrders() {
		return this.adminMapper.getTotalOrders();
	}
	public List<OrderModify> getAllOrders(Integer pageNo){
		if(pageNo == null) pageNo = 1;
		int start = (pageNo - 1) * 5;
		int end = ((pageNo - 1) * 5) + 6;
		StartEnd se = new StartEnd();
		se.setStart(start); se.setEnd(end);
		return this.adminMapper.getAllOrders(se);
	}
	public void modifyOrderState(OrderModify om) {
		this.adminMapper.modifyOrderState(om);
	}
	public List<SalesInfoById> getSalesInfoById(String id) {
		return this.adminMapper.getSalesInfoById(id);
	}
}
























