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

import com.mysql.cj.Session;
import com.org.dao.NotesDao;
import com.org.dao.UserDao;
import com.org.dto.Notes;
import com.org.dto.User;

@WebServlet("/editNote")
public class UpdateNoteById extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDao dao = new UserDao();
		HttpSession session = req.getSession();
		int userId = (Integer)session.getAttribute("userId");
		User user = dao.fetchUserById(userId);
		int noteId = (Integer)session.getAttribute("noteId");
		String title=req.getParameter("title"), description = req.getParameter("description");
		Notes nt = new Notes(title,description);
		nt.setId(noteId);
		
		List<Notes> list = new ArrayList<Notes>();
		list.add(nt);
		
		user.setNotes(list);
		nt.setUser(user);
		
		dao.SaveandUpdateUser(user);
		
		resp.sendRedirect("Try.jsp");
	}
}
