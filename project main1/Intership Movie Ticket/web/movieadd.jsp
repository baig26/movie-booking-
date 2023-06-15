<%-- 
    Document   : movieadd
    Created on : 8 Jun, 2023, 1:27:25 PM
    Author     : Aatifulla Baig
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>JSP Page</title>
     </head>
     <body>
          <%
   try {
     String price = "";
     String mov_name = "";
     String[] movieInfo = request.getParameter("mov_name").split(",");
     if (movieInfo.length == 2) {
       mov_name = movieInfo[0];
       price = movieInfo[1];
     }
     String theater_name = request.getParameter("theater_name");
     String show_time = request.getParameter("show_time");
     int screen_no = Integer.parseInt(request.getParameter("screen_no")); 
     String show_date = request.getParameter("show_date");
     Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
     String sql2 = "insert into show1(movie_name,theater_name,price,screen_no,show_date,show_time) values (?,?,?,?,?,?)";
     PreparedStatement ps = con.prepareStatement(sql2);
     ps.setString(1, mov_name);
     ps.setString(2, theater_name);
     ps.setString(3, price);
     ps.setInt(4, screen_no);
     ps.setString(5, show_date);
     ps.setString(6, show_time);
     out.println(theater_name + show_time + screen_no + show_date + mov_name + price);
     ps.executeUpdate();
     con.close();
response.sendRedirect("theater-details.jsp?theaterName=" + theater_name);
} catch (Exception e) {
    e.printStackTrace();
}
%>
     </body>
</html>
