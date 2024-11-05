<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="L&R2.css">
</head>
<body>
	<%String s = (String)session.getAttribute("Invalid Details"),s1 = (String)session.getAttribute("register");
		if(s!=null&&s.equals("Invalid Details")){%>
			<h3 style="color:red">Invalid Details Login</h3>
		<%}
		else if(s1!=null&&s1.equals("register")){%>
			<h3>Registered Successfully</h3>
		<%}%>
	<div class="main">
        <input type="checkbox" id="chk" aria-hidden="true">
        <div class="signup">
            <form action="registerAndupdate" method="post">
                <label for="chk" aria-hidden="true">Sign Up</label>
                <input type="text" name="name" placeholder="User Name">
                <input type="number" name="age" placeholder="Age">
                <input type="number" name="mobile" placeholder="Phone Number">
                <input type="email" name="email" placeholder="Email">
                <input type="password" name="password" placeholder="Password">
                <button>Sign Up</button>
            </form>
        </div>
        <div class="login">
            <form action="login" method="post">
                <label for="chk" aria-hidden="true">Sign In</label>
                <input type="email" name="email" placeholder="User Email" required>
                <input type="password" name="password" placeholder="User Password" required>
                <button>Sign In</button>
            </form>
        </div>
    </div>
</body>
</html>