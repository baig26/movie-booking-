<%-- 
    Document   : Registration
    Created on : 8 Jun, 2023, 1:18:20 PM
    Author     : Aatifulla Baig
--%>

<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>User Registration</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f2f2f2;
		}
		h1 {
			text-align: center;
			margin-top: 50px;
		}
		form {
			width: 400px;
			margin: 50px auto;
			padding: 30px;
			background-color: #fff;
			box-shadow: 0px 0px 10px #ccc;
			border-radius: 5px;
		}
		label {
			display: block;
			margin-bottom: 10px;
			font-weight: bold;
		}
		input[type="text"], input[type="password"] {
			width: 100%;
			padding: 10px;
			margin-bottom: 20px;
			border: 1px solid #ccc;
			border-radius: 4px;
			box-sizing: border-box;
		}
		input[type="submit"] {
			background-color: #4CAF50;
			color: #fff;
			padding: 10px 20px;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}
		input[type="submit"]:hover {
			background-color: #3e8e41;
		}
		.error {
			color: red;
			font-weight: bold;
		}
		.password-container {
			position: relative;
		}
		.password-toggle {
			position: absolute;
			top: 50%;
			transform: translateY(-50%);
			right: 5px;
			cursor: pointer;
			user-select: none;
		}
	</style>
</head>
<body>
	<h1>User Registration</h1>
	<form method="post" action="register.jsp" >
		<label for="file">Profile Photo:</label>
		<input type="file" name="file" id="file"><br>
		<br>
		<label for="username">Username:</label>
<input type="text" name="username" id="username" required><br>
<label for="contact_number">Contact Number:</label>
<input type="text" name="contact_number" id="contact_number" required><br>
<label for="email">Email:</label>
<input type="email" name="email" id="email" required><br><br>
<label for="password" class="password-container">Password:
    <input type="password" name="password" id="password">
    <span class="password-toggle" onclick="showHidePassword()">Show</span>
</label>
<label for="confirm_password">Confirm Password:</label>
<input type="password" name="confirm_password" id="confirm_password" required><br>
<span class="error" id="password-error"></span><br>
		<input type="submit" value="Register">
	</form>

	<script>
		function showHidePassword() {
			var password = document.getElementById("password");
			var toggle = document.querySelector(".password-toggle");
			if (password.type === "password") {
				password.type = "text";
				toggle.textContent = "Hide";
			} else {
				password.type = "password";
				toggle.textContent = "Show";
			}
		}

		var password = document.getElementById("password");
		var confirm_password = document.getElementById("confirm_password");
		var password_error = document.getElementById("password-error");

		function validatePassword() {
			if (password.value !== confirm_password.value) {
				password_error.textContent = "Passwords do not match";
			} else {
				password_error.textContent = "";
			}
		}

		password.addEventListener("keyup", validatePassword);
                  confirm_password.addEventListener("keyup", validatePassword);
	</script>
</body>
</html>
