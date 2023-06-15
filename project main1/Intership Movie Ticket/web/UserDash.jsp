<%-- 
    Document   : UserDash
    Created on : 8 Jun, 2023, 1:20:04 PM
    Author     : Aatifulla Baig
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.PreparedStatement"%> 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>User</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="design.css">
<!--        <script type="text/javascript" src="newjavascript.js"></script>-->

<style>
    .cancel{
    margin-left: 52rem;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  transition: 0.3s;
  border-radius: 5px;
  margin-bottom: 2rem;
  height: 550px;
  width: 400px;
}


.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.card-img-top {
  height: 15rem;
  object-fit: cover;
}

.card-body {
  text-align: center;
}

.card-title {
  font-size: 1.5rem;
  font-weight: bold;
  margin-bottom: 0.5rem;
}

.card-text {
  font-size: 1.2rem;
  margin-bottom: 1rem;
}

</style>
    </head>
    
    <%
    
        response.setHeader("Cache-Control", "no-cahche, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cahche");
        response.setHeader("Expires", "0");

        

    
    %>
    <body>
         
        <section>
             <%  try {
                             String user_id = request.getParameter("username");
                        
                                    Class.forName("com.mysql.jdbc.Driver");
                                    //step 2 connect to database
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
                                    String sql = "select * from user where user_name=?";
                                    PreparedStatement ps3 = con.prepareStatement(sql);
                                    ps3.setString(1, user_id);
                                    ResultSet rs = ps3.executeQuery();
                                if (!rs.next()) {
        out.println("<h3 class=\"head\">ERROR</h3>");
    } else {
                 String user_name = rs.getString("user_name");
%>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Movie Ticket Booking</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="<%=rs.getString("photo")%>" class="img-fluid rounded-circle" style="height: 30px; width: 30px;">
                    </a>

                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                        <div class="dropdown-header">
                             <center>
                            <img src="<%=rs.getString("photo")%>" class="img-fluid rounded-circle" style="height: 80px; width: 80px;">
                            <h5 class="dropdown-title"><%=rs.getString("user_name")%></h5>
                            <p class="dropdown-subtitle"><%=rs.getString("email")%></p>
                             </center>
                        </div>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="Changeuser.jsp?user_name=<%=user_name%>">
                            <i class="fa fa-key"></i>
                            Change Password
                        </a>
                        <a class="dropdown-item" href="Customerdetails.jsp?user_name=<%=user_name%>">
                            <i class="fa fa-history"></i>
                            History
                        </a>
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#exampleModal">
                            <i class="fa fa-sign-out"></i>
                            Logout
                        </a>
                    </div>
              

                        
                </li>
            </ul>
        </div>
    </nav>

    <!-- Logout Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Movie Ticket Booking</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to logout?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <a href='login.jsp' class="btn btn-success">Logout</a>
                </div>
            </div>
        </div>
    </div>


        </section>
        <section>

<div class="container-fluid px-4">
    <div class="row gx-5 mt-5">
       <% try {
    Class.forName("com.mysql.jdbc.Driver");
    String sql4 = "SELECT * FROM movies";
    PreparedStatement stmt2 = con.prepareStatement(sql4);
    ResultSet rs2 = stmt2.executeQuery();
    if (!rs2.next()) {
        out.println("<h3 class=\"head\">Your Users Are Waiting For New Movie</h3>");
    } else {   
        do {
            String movieName = rs2.getString("name");
            String description = rs2.getString("description");
            
            
            // Retrieve the image path from the result set
            String imagePath = rs2.getString("poster_url");
        %>
                        <div class="col-lg-3">
                            <div class="card" style="width: 18rem;">
                                <img class="card-img-top" src="<%= imagePath %>" alt="<%= movieName %> Poster">
                               <div class="card-body">
    <h5 class="card-title"><%=movieName%></h5>
    <p class="card-text"><%=description%></p>
<button type="button" class="btn btn-primary" onclick="location.href='Userbooking.jsp?username=<%=user_name%>&movie=<%=movieName%>'">Book Now</button>
</div>
                            </div>
                        </div>
        <%
                    } while (rs2.next());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>
</div>
        </section>
    <section>
<%
                                   }
                                   } catch (Exception e) {
                                    }
                                %>
                    

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>

