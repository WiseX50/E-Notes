<%@page import="com.org.dto.User"%>
<%@page import="com.org.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="profile.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="profile.js" defer></script>
</head>
<body>
	<%
	if (session.getAttribute("userId") != null) {
		int id = (Integer) session.getAttribute("userId");
		UserDao dao = new UserDao();
		User user = dao.fetchUserById(id);
	%>
	<!-- NavBar Html -->
	<nav>
		<label class="logo">E-Notes</label>
		<ul>
			<li><a href="Try.jsp" class="neon-button">Home</a></li>
			<li><a href="logout" class="neon-button">Sign Out</a></li>
		</ul>
	</nav>
	<!-- Profile Html -->
	<div class="profileContainer">
		<div class="lftProfile">
			<img src="userImg.png" alt="404 not Found">
			<p><%=user.getName()%></p>
			<div class="option prf">
				<i class="fa fa-id-card"></i>
				<h2>Profile</h2>
			</div>
			<div class="option psw">
				<i class="fa fa-lock"></i>
				<h2>Password</h2>
			</div>
		</div>
		<div class="rightProfile">
			<h1>User Settings</h1>
			<div class="profile activ">
				<form action="registerAndupdate" method="post">
					<div class="frmNameAge ">
						<div class="name">
							<label for="name">Name:-</label> <input type="text" name="name"
								placeholder="Name" value=<%=user.getName()%>>
						</div>
						<div class="age">
							<label for="age">Age:-</label> <input type="number" name="age"
								placeholder="Age" value=<%=user.getAge()%>>
						</div>
					</div>

					<div class="frmMobile frmElement">
						<label for="mobile">Mobile:-</label> <input type="number" name="mobile"
							placeholder="Mobile" value=<%=user.getMobile()%>>
					</div>
					<div class="frmEmail frmElement">
						<label for="email"> Email:-</label> <input type="email" name="email"
							placeholder="Email" value=<%=user.getEmail()%>>
					</div>
					<div class="frmBtn">
						<button>Update</button>
					</div>
				</form>
			</div>
			<div class="password">
				<form action="">
					<label for="currentPass">Current Password:-</label> <input
						type="password" placeholder="Current Password"> <label
						for="newPass">New Password:-</label> <input type="password"
						placeholder="New Password"> <label for="confirmPass">Confirm
						Password:-</label> <input type="password" placeholder="Confirm Password">
					<div class="pssFrmBtn">
						<button>Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%
	} else {
	response.sendRedirect("Login&Register.jsp");
	}
	%>
</body>
</html>