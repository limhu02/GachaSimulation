package com.springboot.myhome.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.myhome.admin.OrderModify;
import com.springboot.myhome.admin.SalesInfoById;
import com.springboot.myhome.model.StartEnd;
import com.springboot.myhome.model.User;

@Mapper
public interface AdminMapper {
	void updateMember(User user);
	User findMemberById(String id);
	Integer findMemberCount(User user);
	List<User> findMember(User user);
	List<OrderModify> getOrdersByState(StartEnd se);
	Integer getOrdersByStateCount(Integer state);
	Integer getTotalOrders();
	List<OrderModify> getAllOrders(StartEnd se);
	void modifyOrderState(OrderModify om);
	List<SalesInfoById> getSalesInfoById(String id);
}










