<%@page import="com.org.dao.NotesDao"%>
<%@page import="com.org.dto.Notes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Edt.css">
</head>
<body>
	<%
	if (session.getAttribute("userId") != null) {
		NotesDao dao = new NotesDao();
	%>
	<div class="main">
		<!-- NavBar Html -->
		<nav>
			<label class="logo">E-Notes</label>
			<ul>

				<li><a href="logout" class="neon-button">Sign Out</a></li>
			</ul>
		</nav>
		<%
		if (session.getAttribute("noteId") != null) {
			int id = (Integer) session.getAttribute("noteId");
			Notes nt = dao.fetchNotesById(id);
		%>
		<!-- Edit Note Container -->
		<div class="container">
			<h2>Edit Note</h2>
			<form action="editNote" class="Popup-content" method="post">
				<label for="title">Title</label> <input type="text"
					placeholder="Title" class="title" name="title"
					value=<%=nt.getTitle()%>> <label for="description">Description</label>
				<textarea name="description" class="descArea"
					placeholder="Description"><%=nt.getDescription()%></textarea>
				<button class="edit btn-three">Edit</button>
			</form>
			<a href="Try.jsp" class="btn-three">Close</a>
		</div>
		<%
		} else {
		response.sendRedirect("Try.jsp");
		}
		%>

	</div>
	<%
	} else {
	response.sendRedirect("Login&Register.jsp");
	}
	%>
</body>
</html>