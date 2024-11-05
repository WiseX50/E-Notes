package com.org.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.org.dto.User;
import com.org.utilities.Helper;

public class UserDao {

	EntityManagerFactory emf = Helper.getEmf();

	public void SaveandUpdateUser(User u) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();

		et.begin();
		em.merge(u);
		et.commit();
	}

	public User loginUser(String email, String pwd) {
		EntityManager em = emf.createEntityManager();

		Query q = em.createQuery("select u from User u where u.email = ?1 and u.password = ?2");
		q.setParameter(1, email);
		q.setParameter(2, pwd);
		List<User> rl = q.getResultList();
		if(rl.isEmpty())
			return null;
		return rl.get(0);
	}

	public void deleteUserById(int id) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();

		User usr = em.find(User.class, id);
		if (usr != null) {
			et.begin();
			em.remove(usr);
			et.commit();
		} else
			System.out.println("404 Not found");
	}

	public User fetchUserById(int id) {
		EntityManager em = emf.createEntityManager();

		User usr = em.find(User.class, id);
		if (usr != null)
			return usr;
		return null;
	}
}
