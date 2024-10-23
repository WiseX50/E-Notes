package com.org.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.org.dto.Notes;
import com.org.utilities.Helper;

@Repository
public class NotesDao {
	EntityManagerFactory emf = Helper.getEmf();

	public Notes fetchNotesById(int id) {
		EntityManager em = emf.createEntityManager();

		Notes nt = em.find(Notes.class, id);
		if (nt != null)
			return nt;
		return null;
	}

	public void deleteNotesByID(int id) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();

		Notes nt = em.find(Notes.class, id);
		if (nt != null) {
			et.begin();
			em.remove(nt);
			et.commit();
		} else
			System.out.println("404 not found");
	}

	public Notes fetchNotesByTitle(String title) {
		EntityManager em = emf.createEntityManager();

		Query q = em.createQuery("select e from Notes e where e.title = ?1");
		q.setParameter(1, title);
		List<Notes> rl = q.getResultList();
		for (Notes n : rl)
			return n;
		return null;
	}
}
