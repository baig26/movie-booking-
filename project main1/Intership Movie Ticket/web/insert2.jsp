<%-- 
    Document   : insert2
    Created on : 8 Jun, 2023, 1:25:14 PM
    Author     : Aatifulla Baig
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
    
    String the_name = request.getParameter("the_name");
    String address = request.getParameter("address");
    String image2 = "images/" + request.getParameter("file2");
    out.println(the_name + address + image2);
    String sql = "INSERT INTO theater(theater_name, address, theater_poster) VALUES (?, ?, ?)";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, the_name);
    ps.setString(2, address);
    ps.setString(3, image2);
        out.println(the_name + address + image2);

    ps.executeUpdate();
        out.println(the_name + address + image2);

    ps.close();
    con.close();
    
    response.sendRedirect("AddMovThe.jsp"); // redirect back to the original JSP file
} catch (Exception e) {
    e.printStackTrace();
}
%>
     </body>
</html>
