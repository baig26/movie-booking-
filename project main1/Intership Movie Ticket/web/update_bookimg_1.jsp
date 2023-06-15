<%-- 
    Document   : update_bookimg_1
    Created on : 8 Jun, 2023, 1:30:11 PM
    Author     : Aatifulla Baig
--%>

<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>

<%try{
     double price = 0.0f;
    String user_name = request.getParameter("user_name");
             String movieName = request.getParameter("Movie_Name");
String theatreName = request.getParameter("theatre");
String date = request.getParameter("date");
String time = request.getParameter("time");
int tickets = Integer.parseInt(request.getParameter("tickets"));
String sql1 = "SELECT price FROM movies WHERE name=?";
Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
            PreparedStatement ps2 = con.prepareStatement(sql1);
            ps2.setString(1, movieName);
            ResultSet rs = ps2.executeQuery();
            if (rs.next()) {
                price = rs.getDouble("price");
            } else {
                out.println("No record matched");
            }
            ps2.close();
            double amt = price * tickets;

        out.println(" data found for user " + price +user_name + theatreName + movieName + tickets + date +time + amt);

        // Update the user record in the database
        String sql = "UPDATE userbooking SET movies_name=?, theater=?, tickets=?, date=?, time=?, fare=? WHERE user_name=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, movieName);
        ps.setString(2, theatreName);
        ps.setInt(3, tickets);
        ps.setString(4, date);
        ps.setString(5, time);
        ps.setDouble(6, amt);
        ps.setString(7, user_name);

        int i=ps.executeUpdate();
if(i>0){
        // Redirect to the profile page
response.sendRedirect("Customerdetails.jsp?user_name=" + user_name);
    }
else{
     out.println(" data found for user " + user_name + theatreName + movieName + tickets + date +time + amt);
}}catch (Exception e) {
        e.printStackTrace();
    }
%>
