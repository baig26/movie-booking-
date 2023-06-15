
<%-- 
    Document   : DeleteThea
    Created on : 8 Jun, 2023, 1:17:44 PM
    Author     : Aatifulla Baig
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Delete theater</title>
     </head>
     <body><%
          Class.forName("com.mysql.jdbc.Driver");
            //step 2 connect to database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
            String sql4 = "delete from theater where theater_id=?";
            int delMov1 = Integer.parseInt(request.getParameter("theater_id"));
            PreparedStatement ps=con.prepareStatement(sql4);
            ps.setInt(1,delMov1);
           int i= ps.executeUpdate();
           if(i>0){
response.sendRedirect("AddMovThe.jsp");
           }
            con.close();  %>
     </body>
</html>
