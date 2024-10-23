package com.org.dao;

import javax.persistence.EntityManagerFactory;

import org.springframework.stereotype.Repository;

import com.org.dto.Notes;

@Repository
public class NotesDao {
	
	public Notes fetchNotesById(int id) {
		
		return null;
	}
	public void deleteNotesByID(int id) {
		
	}
	
	public Notes fetchNotesByTitle(String title) {
		return null;
	}
}
