<%-- 
    Document   : AdminCustomer
    Created on : 8 Jun, 2023, 1:14:27 PM
    Author     : Aatifulla Baig
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Table Creation</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="design.css">

        <style>
            a{
                color: white;
            }
            a:hover{
                color: white;
            }
            .cancel{
                margin-left: 52rem;
            }
            
        </style>
          <style>
            a{
                text-decoration: none!important;
            }
            .navbar{
                color: white;
            }
            .btn{
                color: white;
            }
            .add{
                position: relative;
                left: 36rem;
            }



            .del{
                margin-left: 36rem;
            }
            .cust{
                position: relative;
                left: 36rem;
            }
            .head{
                font-size: 25px;
                text-align: center;
                margin-bottom: 10px;
            }
            .delete{
                color: black;
            }


        </style>
    </head>

    <body>
        
        <section>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Movie Ticket Booking</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
      aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="AdminDashboard.jsp">
            <i class="fa fa-arrow-left"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-sign-out"></i>
          </a>
        </li>
      </ul>
    </div>
  </nav>
</section>


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
                    <a href='Login.html' class="btn btn-success">Logout</a>
                </div>
            </div>
        </div>
    </div>
</section>
         
            <%
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
    String sql = "select * from userbooking";
    PreparedStatement stmt = con.prepareStatement(sql);
    ResultSet rs = stmt.executeQuery();
    if (!rs.next()) {
        out.println("<h3 class=\"head\">No Movie Booked yet</h3>");
    } else {%>
    <table class="table">
        <thead class="thead-dark">
            <tr>
                <th scope="col">user_ID</th>
                    <th scope="col">movie_name</th>
                    <th scope="col">theater_name</th>
                    <th scope="col">no_of_seats</th>
                    <th scope="col">date</th>
                    <th scope="col">show</th>
                    <th scope="col">total_fare</th>
                    <th scope="col">delete</th>
            </tr>
        </thead>
        <tbody>
            <%
            do {%>
            <tr>
                <td><%= rs.getString(1)%></td>
                <td><%= rs.getString(2)%></td>
                <td><%= rs.getString(3)%></td>
                <td><%= rs.getInt(4)%></td>
                <td><%= rs.getDate(5)%></td>
                <td><%= rs.getString(6)%></td>
                <td><%= rs.getDouble(7)%></td>
                <td>
                    <form method="post" action="delete2">
                        <input type="hidden" name="Movie_Name" value="<%= rs.getString(1)%>">
                        <button type="submit" class="btn btn-danger">Delete Movie</button>
                    </form>
                </td>
            </tr>
            <%} while (rs.next());%>
        </tbody>
        <%}
            } catch (Exception e) {
                e.getStackTrace();
            }%>
    </table>
        
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>     
</html>
