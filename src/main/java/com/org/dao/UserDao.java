package com.org.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

import org.springframework.stereotype.Repository;

import com.org.dto.User;
import com.org.utilities.Helper;

@Repository
public class UserDao {
	
	EntityManagerFactory emf = Helper.getEmf();
	
	public void saveUser(User u) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		et.begin();
		em.merge(u);
		et.commit();
	}
	public User loginUser(String email, String pwd) {
		return null;
	}
	public void deleteUserById(int id) {
		
	}
	public User fetchUserById(int id) {
		return null;
	}
}
