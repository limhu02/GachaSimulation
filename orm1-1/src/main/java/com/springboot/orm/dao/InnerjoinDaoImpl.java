package com.springboot.orm.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.springboot.orm.model.Reservation;
import com.springboot.orm.model.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.PersistenceUnit;
@Repository
public class InnerjoinDaoImpl implements InnerjoinDao {
	private EntityManagerFactory emf;
	@PersistenceUnit
	public void setEmf(EntityManagerFactory emf) {
		this.emf = emf;
	}
	@Override
	public List<Object[]> getList() {
		EntityManager em = this.emf.createEntityManager();
		List<Object[]> list = em.createQuery(
			"From User AS user INNER JOIN user.reservations "
			+ "order by user.userId",Object[].class).getResultList();
		
		System.out.println("검색된 건 수:"+list.size());
		for(Object[] objArray : list) {
			User user = (User)objArray[0];
			Reservation reservation = (Reservation)objArray[1];
			System.out.println("고객번호:"+user.getUserId()+
					",예약번호:"+reservation.getReservationId()+
					",예약시간:"+reservation.getTimestamp());
		}
		return list;
	}

}










