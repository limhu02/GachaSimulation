package com.springboot.orm.dao;

import java.util.List;

public interface EmployeeDao {
	List<Object[]> getList(Integer id);
	

}
