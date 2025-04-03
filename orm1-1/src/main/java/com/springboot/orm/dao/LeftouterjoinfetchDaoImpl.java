package com.springboot.orm.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.springboot.orm.model.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.PersistenceUnit;
@Repository
public class LeftouterjoinfetchDaoImpl implements LeftouterjoinfetchDao {
	private EntityManagerFactory emf;
	@PersistenceUnit
	public void setEmf(EntityManagerFactory emf) {
		this.emf = emf;
	}

	@Override
	public List<User> getList() {
		EntityManager em = this.emf.createEntityManager();
		List<User> list = em.createQuery(
				"From User AS user LEFT OUTER JOIN FETCH user.reservations "
				+ "order by user.userId",User.class).getResultList();
		return list;
	}

}











