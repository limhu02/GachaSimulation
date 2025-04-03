package com.springboot.orm.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.springboot.orm.model.Reservation;
import com.springboot.orm.model.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.PersistenceUnit;
@Repository
public class InnerjoinfetchDaoInpl implements InnerjoinfetchDao {
	private EntityManagerFactory emf;
	@PersistenceUnit
	public void setEmf(EntityManagerFactory emf) {
		this.emf = emf;
	}
	@Override
	public List<User> getList() {
		EntityManager em = this.emf.createEntityManager();
		List<User> list = em.createQuery(
				"From User AS user INNER JOIN FETCH user.reservations "
				+ "order by user.userId",User.class).getResultList();
		System.out.println("검색된 건 수:"+list.size());
		for(User user : list) {
			System.out.print("사용자 번호:"+user.getUserId());
			System.out.println("사용자 이름:"+user.getName());
			for(Reservation reserv : user.getReservations()) {
				System.out.print("======예약번호:"+reserv.getReservationId());
				System.out.println("======예약시간:"+reserv.getTimestamp());
			}
		}
		return list;
	}

}









