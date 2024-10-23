package com.org.utilities;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Helper {
	private static EntityManagerFactory emf;
	
	public static EntityManagerFactory getEmf() {
		if(emf==null)
			emf=Persistence.createEntityManagerFactory("satya");
		return emf;
	}
}
