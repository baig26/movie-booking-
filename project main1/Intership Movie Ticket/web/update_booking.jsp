<%-- 
    Document   : update_booking
    Created on : 8 Jun, 2023, 1:29:16 PM
    Author     : Aatifulla Baig
--%>

<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>

<%
     
    String user_name = request.getParameter("user_name");
    String cnum = request.getParameter("cnum");
    String email = request.getParameter("email");
    String photo = "images/" + request.getParameter("photo");
    String user_pw = request.getParameter("user_pw");

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Establish a connection to the database
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");

        // Update the user record in the database
        String sql = "UPDATE user SET cnum=?, email=?, photo=?, user_pw=? WHERE user_name=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, cnum);
        ps.setString(2, email);
        ps.setString(3, photo);
        ps.setString(4, user_pw);
        ps.setString(5, user_name);
        int i=ps.executeUpdate();
if(i>0){
        // Redirect to the profile page
response.sendRedirect("UserDash.jsp?username=" + user_name);
    }
else{
     out.println(" data found for user " + user_name + cnum + email + photo + user_pw);
}}catch (Exception e) {
        e.printStackTrace();
    }
%>
