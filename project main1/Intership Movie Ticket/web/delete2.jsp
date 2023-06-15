<%-- 
    Document   : delete2
    Created on : 8 Jun, 2023, 1:23:52 PM
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
     <body><%
          String theaterName = request.getParameter("theaterName");
          
            Class.forName("com.mysql.jdbc.Driver");
            //step 2 connect to database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
            String sql = "delete from  show1 where show_id=?";
           String delMovStr = request.getParameter("show_id");
if (delMovStr != null && !delMovStr.isEmpty()) {
    int delMov = Integer.parseInt(delMovStr);
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, delMov);
    // rest of your code
        out.println(delMov);

    int i= ps.executeUpdate();
           if(i>0){
                response.sendRedirect("theater-details.jsp?theaterName=" + theaterName);
          }
}            
            con.close();
            %>
     </body>
</html>
