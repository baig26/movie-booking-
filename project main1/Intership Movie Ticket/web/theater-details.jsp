<%-- 
    Document   : theater-details
    Created on : 8 Jun, 2023, 1:28:36 PM
    Author     : Aatifulla Baig
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>	<title>Movie Ticket Booking</title>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css" />
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
         <link rel="stylesheet" href="Theaterdeatils.css">

</head>
<body>
     <%
    String theater_name = request.getParameter("theaterName");

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
%>
	

    
    <body>
        <%

            response.setHeader("Cache-Control", "no-cache,no-store");


        %>
        
        <section>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
         <ul class="navbar-nav ml-auto">
  <li class="nav-item">
    <a class="nav-link" href="AdminDashboards.jsp">
      <div class="circle"><i class="fa fa-arrow-left" aria-hidden="true"></i></div>
    </a>
  </li>
</ul>
        <a class="navbar-brand" href="#">Movie Ticket Booking/Shows at <%= theater_name %> theater </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-user-circle-o fa-lg"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                        <button type="button" class="dropdown-item" data-toggle="modal" data-target="#addMovieModal12">
                                                      <i class="fa fa-plus-circle"></i> Add Movie
                    </button>
                         
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
                    <a href='adminlogin.jsp' class="btn btn-success">Logout</a>
                </div>
            </div>
        </div>
    </div>
</section>
        
        <br>
        
<div class="container-fluid">
  <div class="row">
    <div class="col-md-12">
      <table class="table">
        <thead class="thead-dark">
          <tr>
            <th>Movie Name</th>
            <th>Price</th>
            <th>Screen No</th>
            <th>Show Date</th>
            <th>Show Time</th>
            <th>Earnings</th>
            <th>delete</th>          </tr>
        </thead>
        <tbody>
          <% 
            // retrieve data from the show table for the current theater
           PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM show1 WHERE theater_name=?");
ps1.setString(1, theater_name);
ResultSet rs = ps1.executeQuery();
int totalEarnings = 0;

// iterate through each row of the show table
while (rs.next()) {
  // retrieve show data from the current row
  int show_id = rs.getInt("show_id");
  String movieName = rs.getString("movie_name");
  int price = rs.getInt("price");
  int screenNo = rs.getInt("screen_no");
  Date showDate = rs.getDate("show_date");
  String showTime = rs.getString("show_time");

  // calculate the earnings for the current show
  PreparedStatement ps2 = conn.prepareStatement("SELECT SUM(fare) AS earnings FROM userbooking WHERE movies_name=? AND theater=? and screen_no=?");
  ps2.setString(1, movieName);
  ps2.setString(2, theater_name);
   ps2.setInt(3, screenNo);
  ResultSet earningsRs = ps2.executeQuery();
  earningsRs.next();
  int earnings = earningsRs.getInt("earnings");
  totalEarnings += earnings;

  %>
  <tr>
    <td><%= movieName %></td>
    <td><%= price %></td>
    <td><%= screenNo %></td>
    <td><%= showDate %></td>
    <td><%= showTime %></td>
    <td><%= earnings %></td>
    <td>
      <form method="post" action="delete.jsp?theaterName=<%= theater_name %>">
  <input type="hidden" name="show_id" value="<%= show_id %>">
  <button type="submit" class="btn btn-danger">Delete Movie</button>
</form>

    </td>
  </tr>
  <% 
  earningsRs.close();
  ps2.close();
}
// close the result set and prepared statement
rs.close();
ps1.close();
%>
<tr>
  <td colspan="5" style="text-align:right; font-weight:bold;">Total Earnings:</td>
  <td><%= totalEarnings %></td>
</tr>
</tbody>
      </table>
</div>
  </div>
</div>

          
          
<!-- Add Movie Modal -->
<div class="modal fade" id="addMovieModal12" tabindex="-1" role="dialog" aria-labelledby="addMovieModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
           <div class="modal-header">
    <h5 class="modal-title" id="addMovieModalLabel">Add Movie to <%=theater_name%> Theater</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
            <div class="modal-body">
                                   <form method="post" action="movieadd.jsp">

   
   <div class="form-group">
     <label for="mov_name">Movie Name</label>
     <select name="mov_name" class="form-control">
       <option value="">Select</option>
       <% 
       try {
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
         Statement stmt2 = conn2.createStatement();
         ResultSet rs3 = stmt2.executeQuery("SELECT * FROM movies");
         while (rs3.next()) {
           String movieName = rs3.getString("name");
           String price = rs3.getString("price");
           %>
           <option value="<%=movieName%>,<%=price%>"><%=movieName%></option>
           <% 
         }
         rs3.close();
         stmt2.close();
         conn2.close();
       } catch (Exception e) {
         out.print(e);
       }
       %>
     </select>
   </div>
   <div class="form-group">
     <label for="show_date">Show Date</label>
     <input type="date" class="form-control" id="show_date" name="show_date">
   </div>
   <div class="form-group">
     <label for="show_time">Show Timing</label>
     <select name="show_time" class="form-control">
       <option value="">Select timing</option>
       <%


       // fetch movie data from movies table

       try {
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");                       
         String sql2 = "SELECT sch_time FROM schedule";
         PreparedStatement ps = conn3.prepareStatement(sql2);
         ResultSet rs4 = ps.executeQuery();

         while (rs4.next()) {
           String sch_time = rs4.getString("sch_time");
           %>
           <option value="<%= sch_time %>"><%= sch_time %></option>
           <%
         }
         rs4.close();
         ps.close();
         conn3.close();
       } catch (Exception e) {
         e.printStackTrace();
       }
       %>
     </select>
   </div>
   <div class="form-group">
     <label for=""screen_no">Screen Number</label>
<select name="screen_no" class="form-control">
<option value="">Select Screen</option>
<%
try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
Statement stmt4 = conn4.createStatement();
ResultSet rs5 = stmt4.executeQuery("SELECT screen_no FROM screen");
while (rs5.next()) {
int screenNo = rs5.getInt("screen_no");
%>
<option value="<%=screenNo%>"><%=screenNo%></option>
<%
}
rs5.close();
stmt4.close();
conn4.close();
} catch (Exception e) {
out.print(e);
}
%>
</select>
<div class="form-group">
     <input type="hidden" class="form-control" id="theater_name" value="<%=theater_name%>" name="theater_name">
   </div>   </div>
   <button type="submit" class="btn btn-primary">Add Movie</button>
 </form>

            </div> 
        </div>
    </div>
</div>



  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-5rWJ+U6IXbIoF9Bf4jcTrZ6OwujC+g2YLfd0lSvlnauLzJgOW+vTqXuxI/HgrvZ2"
        crossorigin="anonymous"></script>


</body>
</html>
