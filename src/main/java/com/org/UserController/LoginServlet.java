package com.org.UserController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.org.dao.UserDao;
import com.org.dto.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email"),password=req.getParameter("password");
		UserDao dao = new UserDao();
		User usr = dao.loginUser(email, password);
		HttpSession hs = req.getSession();
		
		if(usr==null) {
			hs.setAttribute("Invalid Details", "Invalid Details");
			resp.sendRedirect("Login&Register.jsp");
		}
		else {
			hs.setAttribute("userId", usr.getId());
			resp.sendRedirect("Try.jsp");
		}
			
	}
}
