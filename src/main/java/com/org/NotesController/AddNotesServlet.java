package com.org.NotesController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.UserDao;
import com.org.dto.Notes;
import com.org.dto.User;
@WebServlet("/addNote")
public class AddNotesServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDao dao = new UserDao();
		HttpSession hs = req.getSession();
		int id = (Integer)hs.getAttribute("userId");
		User user = dao.fetchUserById(id);
		String title=req.getParameter("title"), description = req.getParameter("description");
		Notes nt = new Notes(title, description);
		
		List<Notes> list = new ArrayList<Notes>();
		list.add(nt);
		
		user.setNotes(list);
		nt.setUser(user);
		
		
		dao.SaveandUpdateUser(user);
		
		hs.setAttribute("userObj", user);
		hs.setAttribute("success", "Notes Successfuly Added...");
		resp.sendRedirect("Try.jsp");
	}

}
