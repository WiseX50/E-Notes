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
	<div class="main">
        <input type="checkbox" id="chk" aria-hidden="true">
        <div class="signup">
            <form action="register" method="get">
                <label for="chk" aria-hidden="true">Sign Up</label>
                <input type="text" name="name" placeholder="Administrator Name">
                <input type="number" name="age" placeholder="Age">
                <input type="email" name="email" placeholder="Email">
                <input type="number" name="phNum" placeholder="Phone Number">
                <input type="password" name="pswd" placeholder="Password">
                <button>Sign Up</button>
            </form>
        </div>
        <div class="login">
            <form action="clickLogin" method="post">
                <label for="chk" aria-hidden="true">Login</label>
                <input type="email" name="email" placeholder="Administrator Email" required>
                <input type="password" name="pswd" placeholder="Admin Password" required>
                <button>Login</button>
            </form>
        </div>
    </div>
</body>
</html>