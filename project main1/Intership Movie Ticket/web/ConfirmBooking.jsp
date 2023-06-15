<%-- 
    Document   : ConfirmBooking
    Created on : 8 Jun, 2023, 1:22:34 PM
    Author     : Aatifulla Baig
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- Retrieve the form data from the request object --%>
<%
    String movieName = request.getParameter("Movie_Name");
    String user_name = request.getParameter("user_name");
    String theatreName = request.getParameter("theatre");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    int tickets = Integer.parseInt(request.getParameter("tickets"));
%>

<!DOCTYPE html>
<html>
<head>
	<title>Confirm Booking</title>
         <style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f2f2f2;
		}
		h1 {
			color: #333333;
		}
		table {
			margin: 20px;
			padding: 20px;
			background-color: #ffffff;
			border-collapse: collapse;
			box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
		}
		td {
			padding: 10px;
			border: 1px solid #dddddd;
		}
		.hidden-input {
			display: none;
		}
		input[type="submit"] {
			background-color: #4CAF50;
			border: none;
			color: white;
			padding: 10px 20px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin: 10px 0;
			cursor: pointer;
			border-radius: 5px;
		}
		input[type="submit"]:hover {
			background-color: #3e8e41;
		}
	</style>
</head>
<body>
	<h1>Confirm Booking</h1>
	<p>Please confirm your booking details:</p>

	<table>
		<tr>
			<td>Movie Name:</td>
			<td><%=movieName%></td>
		</tr>
                  <tr>
			<td>user Name:</td>
			<td><%=user_name%></td>
		</tr>
		<tr>
			<td>Theatre Name:</td>
			<td><%=theatreName%></td>
		</tr>
		<tr>
			<td>Date:</td>
			<td><%=date%></td>
		</tr>
		<tr>
			<td>Time:</td>
			<td><%=time%></td>
		</tr>
		<tr>
			<td>No. of Tickets:</td>
			<td><%=tickets%></td>
		</tr>
        <%-- Retrieve the price of the movie from the database --%>
       <%
    double price = 0.0f;
    String screen_no = ""; // declare variable outside if block
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
    String sql1 = "SELECT price, screen_no FROM show1 WHERE movie_name=? and theater_name=? and show_time=?";
    PreparedStatement ps2 = con.prepareStatement(sql1);
    ps2.setString(1, movieName);
    ps2.setString(2, theatreName);
    ps2.setString(3, time);
    ResultSet rs = ps2.executeQuery();
    if (rs.next()) {
        price = rs.getDouble("price");
        screen_no = rs.getString("screen_no"); // assign value to variable
    } else {
        out.println("No record matched");
    }
    ps2.close();
    double amt = price * tickets;
%>
<tr>
    <td>Total Amount:</td>
    <td><%=amt%></td>
</tr>
<tr>
    <td>Screen Number:</td>
    <td><%=screen_no%></td>
</tr>

	</table>

	<form method="post" action="book.jsp?user_name=<%=user_name%>">
               	<input type="hidden" name="user_name" value="<%=user_name%>">
		<input type="hidden" name="Movie_Name" value="<%=movieName%>">
		<input type="hidden" name="theatre" value="<%=theatreName%>">
		<input type="hidden" name="date" value="<%=date%>">
		<input type="hidden" name="time" value="<%=time%>">
		<input type="hidden" name="tickets" value="<%=tickets%>">
                  <input type="hidden" name="screen_no" value="<%=screen_no%>">
        <input type="hidden" name="amt" value="<%=amt%>">
		<input type="submit" value="Confirm Booking">
	</form>
</body>
</html>
