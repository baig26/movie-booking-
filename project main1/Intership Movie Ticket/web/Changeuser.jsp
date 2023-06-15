<%-- 
    Document   : Changeuser
    Created on : 8 Jun, 2023, 1:22:02 PM
    Author     : Aatifulla Baig
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Change User Details</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f5f5f5;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        }

        h1 {
            margin-bottom: 30px;
        }

        .password-toggle {
            margin-left: 10px;
            cursor: pointer;
        }

        #error-message {
            color: red;
            font-size: 14px;
            margin-top: 10px;
            display: none;
        }
    </style>
</head>

<body>
    <% String user_name = request.getParameter("user_name"); %>
    <div class="container mt-5">
        <h1 class="text-center">Change User Details <%= user_name %></h1>
        <form method="post" action="update_booking.jsp">
            <!-- your input fields here -->

            <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
            String sql = "select * from user where user_name=?";
            PreparedStatement ps3 = con.prepareStatement(sql);
            ps3.setString(1, user_name);
            ResultSet rs = ps3.executeQuery();

            if (rs.next()) {
                String pass = rs.getString("user_pw");
                String cnum = rs.getString("cnum");
                String email = rs.getString("email");
                String photo = rs.getString("photo");

                // rest of the code to display the form fields with the retrieved data
            %>

            <input type="hidden" class="form-control" id="user_name" name="user_name" value="<%= user_name %>">

            <div class="form-group">
                <label for="cnum">Contact Number:</label>
                <input type="text" class="form-control" id="cnum" name="cnum" value="<%= cnum %>" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
            </div>
            <div class="form-group">
                <label for="photo">Photo:</label>
                <input type="file" class="form-control-file" id="photo" name="photo" required>
            </div>
            <div class="form-group">
                <label for="user_pw">Password:</label>
                <div class="input-group">
                    <input type="password" class="form-control" id="user_pw" name="user_pw" value="<%= pass %>" required>
                    <div class="input-group-append">
                        <button type="button" class="btn btn-outline-secondary password-toggle" onclick="showHidePassword()">
                            Show
                        </button>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password:</label>
                <input type="password" class="form-control" id="confirm_password" name="confirm_password" required>
                <span id="password-error"></span>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Save Changes</button>
            </div>
        </form>

        <%} else {
        out.println("No data found for user " + user_name);
    }%>
    </div>



    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
  function showHidePassword() {
    var password = document.getElementById("user_pw");
    var toggle = document.querySelector(".password-toggle");
    if (password.type === "password") {
      password.type = "text";
      toggle.textContent = "Hide";
    } else {
      password.type = "password";
      toggle.textContent = "Show";
    }
  }

  var password = document.getElementById("user_pw");
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

  document.addEventListener("DOMContentLoaded", function() {
    validatePassword();
  });
</script>


			
</body>
</html>
