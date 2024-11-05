<%@page import="com.org.dto.Notes"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dto.User"%>
<%@page import="com.org.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="homeCss.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="try.js" defer></script>
</head>
<body>
	<%
	if (session.getAttribute("userId") != null) {
		int userId = (Integer) session.getAttribute("userId");
	%>
	<div class="main">
		<!-- NavBar Html -->
		<nav>
			<label class="logo">E-Notes</label>
			<ul>
				<li><a href="Profile.jsp" class="neon-button">Profile</a></li>
				<li><a href="#" class="neon-button">About</a></li>
				<li><a href="logout" class="neon-button">Sign Out</a></li>
			</ul>
		</nav>
		<!-- Center Container Html -->
		<section class="container">
			<button class="addNote">
				<i class="fa-regular fa-plus"></i>
			</button>

			<!-- StickyNotes -->
			<div class="notesContainer">
				<%
				UserDao dao = new UserDao();
				User user = dao.fetchUserById(userId);
				List<Notes> notes = user.getNotes();
				for (Notes n : notes) {
				%>
				<div class="stickyNote-Container">
					<h2><%=n.getTitle()%></h2>
					<p><%=n.getDescription()%></p>
					<div class="noteButton">

						<a href="noteEdt?id=<%=n.getId()%>" class="editBtn stickyBtn"><i
							class="fa fa-pen-to-square"></i></a> <a
							href="delete?id=<%=n.getId()%>" class="deleteBtn stickyBtn"><i
							class="fa fa-trash"></i></a>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</section>
	</div>


	<!-- Popup Html for Adding Notes -->
	<div class="Popup-container">
		<h1 class="newNote">New Note</h1>
		<form action="addNote" class="form" method="post">
			<label for="title">Title</label> <input type="text"
				placeholder="Title" name="title" class="title" required> <label
				for="description">Description</label>
			<textarea name="description" class="descArea"
				placeholder="Your Description" required></textarea>
			<div class="btnContainer">
				<button class="btn createNew btn-three">Create</button>
			</div>
		</form>
		<button class="btn close btn-three">Close</button>
	</div>
	<%
	} else {
	response.sendRedirect("Login&Register.jsp");
	}
	%>

</body>
</html>