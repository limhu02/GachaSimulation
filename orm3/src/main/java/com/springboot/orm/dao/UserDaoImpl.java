package com.springboot.orm.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.PersistenceUnit;
@Repository
public class UserDaoImpl implements UserDao {
	private EntityManagerFactory emf;
	@PersistenceUnit
	public void setEmf(EntityManagerFactory emf) {
		this.emf = emf;
	}

	public List<Object[]> getImageList(String id) {
		EntityManager em = this.emf.createEntityManager();
		List<Object[]> list = em.createQuery(
			"FROM Imagebbs_tbl AS imagebbs INNER JOIN imagebbs.user "
		+ "where imagebbs.user.user_id = :id order by imagebbs.w_id",Object[].class)
				.setParameter("id", id).getResultList();
		return list;
	}

}










