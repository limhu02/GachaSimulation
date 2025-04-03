package com.springboot.orm.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.PersistenceUnit;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	private EntityManagerFactory emf;
	@PersistenceUnit
	public void setEmf(EntityManagerFactory emf) {
		this.emf = emf;
	}
	@Override
	public List<Object[]> getList(Integer id) {
		EntityManager em = this.emf.createEntityManager();
		List<Object[]> empList = 
			em.createQuery(
				"From Employees AS emp INNER JOIN emp.department "
				+ "where emp.employee_id = :id",Object[].class)
			.setParameter("id", id).getResultList();
		return empList;
	}
}
