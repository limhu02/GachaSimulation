package com.springboot.orm.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.PersistenceUnit;
@Repository
public class LeftouterjoinDaoImpl implements LeftouterjoinDao {
	private EntityManagerFactory emf;
	@PersistenceUnit
	public void setEmf(EntityManagerFactory emf) {
		this.emf = emf;
	}

	public List<Object[]> getList() {
		EntityManager em = this.emf.createEntityManager();
		List<Object[]> list = em.createQuery(
				"From User AS user LEFT OUTER JOIN user.reservations "
				+ "order by user.userId",Object[].class).getResultList();
		return list;
	}

}







