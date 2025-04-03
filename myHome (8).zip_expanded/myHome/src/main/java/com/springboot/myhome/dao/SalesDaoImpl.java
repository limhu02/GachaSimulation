package com.springboot.myhome.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.PersistenceUnit;
@Repository
public class SalesDaoImpl implements SalesDao {
	private EntityManagerFactory emf;
	@PersistenceUnit
	public void setEmf(EntityManagerFactory emf) {
		this.emf = emf;
	}
	public List<Object[]> getSales(String id) {
		EntityManager em = this.emf.createEntityManager();
		List<Object[]> list = 
			em.createQuery(
				"FROM Sales_tbl AS sales INNER JOIN sales.details "
				+ "where sales.user_id = :id ",Object[].class)
			.setParameter("id", id).getResultList();
		return list;
	}

}














