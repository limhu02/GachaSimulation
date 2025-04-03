package com.springboot.myhome.dao;

import org.springframework.stereotype.Repository;

import com.springboot.myhome.model.SellingItem;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.PersistenceUnit;
@Repository
public class SellingItemDaoImpl implements SellingItemDao {
	private EntityManagerFactory emf;
	@PersistenceUnit
	public void setEmf(EntityManagerFactory emf) {
		this.emf = emf;
	}

	public SellingItem getItem(String code) {
		EntityManager em = this.emf.createEntityManager();
		return em.find(SellingItem.class, code);//기본키로 상품 조회
	}

}





