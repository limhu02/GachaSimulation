package com.springboot.orm.dao;

import org.springframework.stereotype.Repository;

import com.springboot.orm.model.Imagebbs_tbl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.PersistenceUnit;
@Repository
public class ImageDaoImpl implements ImageDao {
	private EntityManagerFactory emf;
	@PersistenceUnit
	public void setEmf(EntityManagerFactory emf) {
		this.emf = emf;
	}
	public Imagebbs_tbl getImagebbs(Integer id) {
		EntityManager em = this.emf.createEntityManager();
		Imagebbs_tbl imagebbs = em.find(Imagebbs_tbl.class, id);//기본키로 조회
		return imagebbs;
	}

}







