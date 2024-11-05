package com.org.UserController;

import java.io.IOException;
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

@WebServlet("/registerAndupdate")
public class RegisterServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession hs = req.getSession();
		if(hs.getAttribute("userId")!=null) {
			UserDao dao = new UserDao();
			int id = (Integer) hs.getAttribute("userId");
			User user = dao.fetchUserById(id);
			String name = req.getParameter("name"),email=req.getParameter("email");
			int age = Integer.parseInt(req.getParameter("age"));
			long mobile = Long.parseLong(req.getParameter("mobile"));
//			User usr = new User();
//			List<Notes> note = user.getNotes();
			
			user.setName(name);
			user.setAge(age);
			user.setEmail(email);
//			usr.setPassword(password);
			user.setMobile(mobile);
//			usr.setNotes(note);
			
			
			
			dao.SaveandUpdateUser(user);
			
			hs.setAttribute("userId", user.getId());
			resp.sendRedirect("Profile.jsp");
		}else {
			String name = req.getParameter("name"),email=req.getParameter("email"),password=req.getParameter("password");
			int age = Integer.parseInt(req.getParameter("age"));
			long mobile = Long.parseLong(req.getParameter("mobile"));
			User usr = new User();
			UserDao dao = new UserDao();
			
			usr.setName(name);
			usr.setAge(age);
			usr.setEmail(email);
			usr.setPassword(password);
			usr.setMobile(mobile);
			
			dao.SaveandUpdateUser(usr);
			
			hs.setAttribute("register", "register");
			resp.sendRedirect("Login&Register.jsp");
		}
		
	}

}
