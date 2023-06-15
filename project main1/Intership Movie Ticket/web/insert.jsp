<%-- 
    Document   : insert
    Created on : 8 Jun, 2023, 1:24:48 PM
    Author     : Aatifulla Baig
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
    
    String mov_name = request.getParameter("mov_name");
    String description = request.getParameter("description");
    int price = Integer.parseInt(request.getParameter("price"));
    String image = "images/" + request.getParameter("file");
    
    String sql = "INSERT INTO movies(name, description, price, poster_url) VALUES (?, ?, ?, ?)";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, mov_name);
    ps.setString(2, description);
    ps.setInt(3, price);
    ps.setString(4, image);
    
    ps.executeUpdate();
    
    ps.close();
    con.close();
    
    response.sendRedirect("AddMovThe.jsp"); // redirect back to the original JSP file
} catch (Exception e) {
    e.printStackTrace();
}
%>
 
     </body>
</html>
