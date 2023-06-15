<%-- 
    Document   : AddMovThe
    Created on : 8 Jun, 2023, 1:13:08 PM
    Author     : Aatifulla Baig
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*, java.io.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Movie</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
img {
  width: 150px;
  height: 200px;
}
.movie-poster img {
  width: 150px;
  height: 200px;
}

.theater-poster img {
  width: 150px;
  height: 200px;
}

  body {
      background-color: #f2f2f2;
    }

    .navbar {
      background-color: #212529 !important;
    }

    .navbar-brand {
      color: #ffffff !important;
      font-size: 24px;
      font-weight: bold;
    }

    .navbar-toggler {
      border: none;
    }

    .navbar-toggler-icon {
      background-image: url("https://cdn4.iconfinder.com/data/icons/wirecons-free-vector-icons/32/menu-alt-512.png");
      width: 20px;
      height: 20px;
    }

    .navbar-nav .nav-item {
      margin-right: 20px;
    }

    .nav-link {
      color: #ffffff !important;
      font-size: 18px;
    }

    .dropdown-menu-right {
      left: auto !important;
      right: 0;
    }

    .dropdown-menu .dropdown-item {
      color: #212529 !important;
    }

    .circle {
      border-radius: 50%;
      width: 40px;
      height: 40px;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #ffffff;
    }

    .circle i {
      color: #212529;
    }

    .table {
      background-color: #ffffff;
    }

    .table th,
    .table td {
      text-align: center;
    }

    .table th {
      font-size: 20px;
      font-weight: bold;
      color: #212529;
    }

    .table td {
      font-size: 18px;
      color: #6c757d;
    }

    .movie-image {
      width: 100px;
      height: auto;
    }

    .modal-header {
      background-color: #212529;
      color: #ffffff;
    }

    .modal-title {
      font-size: 24px;
      font-weight: bold;
    }

    .modal-body {
      font-size: 18px;
    }

    .modal-footer {
      background-color: #f2f2f2;
    }

    .btn-secondary {
      background-color: #6c757d;
      border-color: #6c757d;
    }

    .btn-success {
      background-color: #28a745;
      border-color: #28a745;
    }

    .btn-danger {
      background-color: #dc3545;
      border-color: #dc3545;
    }
</style>

</head>
<body>
      

      <section>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <ul class="navbar-nav ml-auto">
  <li class="nav-item">
    <a class="nav-link" href="AdminDashboards.jsp">
      <div class="circle"><i class="fa fa-arrow-left" aria-hidden="true"></i></div>
    </a>
  </li>
</ul>

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
                        <i class="fa fa-user-circle-o fa-lg"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                        <button type="button" class="dropdown-item" data-toggle="modal" data-target="#addMovieModal">
                                                      <i class="fa fa-plus-circle"></i> Add Movie
                    </button>
                         <button type="button" class="dropdown-item" data-toggle="modal" data-target="#addMovieModal12">
                                                      <i class="fa fa-plus-circle"></i> Add theater
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
                    <a href='Adminlogin.jsp' class="btn btn-success">Logout</a>
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
            <th>Description</th>
            <th>Screen price</th>
            <th>Poster URL</th>
            <th>Delete</th>
            
          </tr>
        </thead>
        <tbody>
          <%
            // Import necessary classes
             
            // Create connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
            // retrieve data from the show table for the current theater
            PreparedStatement ps1 = con.prepareStatement("SELECT * FROM movies");
            ResultSet rs = ps1.executeQuery();

            // iterate through each row of the show table
            while (rs.next()) {
              // retrieve show data from the current row
              String movieName = rs.getString("name");
              String description = rs.getString("description");
              int price = rs.getInt("price");
              String poster_url = rs.getString("poster_url");
          %>
          <tr>
            <td><%= movieName %></td>
            <td><%= description %></td>
            <td><%= price %></td>
            <td><img src="<%= poster_url %>" alt="<%= movieName %>" class="movie-image"></td>
            <td>
              <form method="post" action="delete">
                <input type="hidden" name="mov_name" value="<%= movieName %>">
                <button type="submit" class="btn btn-danger">Delete Movie</button>
              </form>
            </td>
          </tr>
          <% 
            }
            rs.close();
            ps1.close();
          %>
        </tbody>
      </table>
    </div>
  </div>
</div>

<div class="modal fade" id="addMovieModal" tabindex="-1" role="dialog" aria-labelledby="addMovieModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addMovieModalLabel">Add New Movie</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="insert.jsp" method="post">
          <div class="form-group">
            <label>Movie Name</label>
            <input type="text" class="form-control" autocomplete="off" placeholder="Enter movie name" name="mov_name" required>
          </div>
          <div class="form-group">
            <label>Description</label>
            <input type="text" class="form-control" autocomplete="off" placeholder="Enter movie description" name="description" required>
          </div>
          <div class="form-group">
            <label>Price</label>
            <input type="number" class="form-control" autocomplete="off" placeholder="Enter screen price" name="price" required>
          </div>
          <div class="form-group theater-poster">
  <label>Poster URL</label>
  <input type="file" class="form-control" name="file" accept="image/*" required>
</div>
          <div class="form-group">
            <button type="submit" class="btn btn-primary">Add Movie</button>
          </div>
        </form>
      </div>
</div>
<br>
<br>
<br>
  </div>
</div>
<div class="container-fluid">
  <div class="row">
    <div class="col-md-12">
      <table class="table">
        <thead class="thead-dark">
          <tr>
            <th>Theater_ID</th>
            <th>Theater_name</th>
            <th>Address</th>
            <th>theater_poster</th>
            <th>Delete</th>
          </tr>
        </thead>
        <tbody>
          <%
            // Import necessary classes
             
            // Create connection
            Class.forName("com.mysql.jdbc.Driver");
            // retrieve data from the show table for the current theater
            PreparedStatement ps2 = con.prepareStatement("SELECT * FROM theater");
            ResultSet rs2 = ps2.executeQuery();

            // iterate through each row of the show table
            while (rs2.next()) {
              // retrieve show data from the current row
              int theater_id = rs2.getInt("theater_id");     
              String theater_name = rs2.getString("theater_name");
              String address = rs2.getString("address");
              String theater_poster = rs2.getString("theater_poster");
          %>
          <tr>
            <td><%= theater_id %></td>
            <td><%= theater_name %></td>
            <td><%= address %></td>
            <td><img src="<%= theater_poster %>" alt="<%= theater_name %>" class="movie-image"></td>
            <td>
              <form method="post" action="DeleteThea.jsp">
                <input type="hidden" name="theater_id" value="<%= theater_id %>">
                <button type="submit" class="btn btn-danger">Delete Theater</button>
              </form>
            </td>
          </tr>
          <% 
            }
            rs2.close();
            ps2.close();
          %>
        </tbody>
      </table>
    </div>
  </div>
</div>


<div class="modal fade" id="addMovieModal12" tabindex="-1" role="dialog" aria-labelledby="addMovieModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addMovieModal12Label">Add New theater</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="insert2.jsp" method="post">
          <div class="form-group">
            <label>Theater Name</label>
            <input type="text" class="form-control" autocomplete="off" placeholder="Enter theater name" name="the_name" required>
          </div>
          <div class="form-group">
            <label>Address</label>
            <input type="text" class="form-control" autocomplete="off" placeholder="Enter Address" name="address" required>
          </div>
         
         <div class="form-group movie-poster">
  <label>Poster URL</label>
  <input type="file" class="form-control" name="file2" accept="image/*" required>
</div>
          <div class="form-group">
            <button type="submit" class="btn btn-primary">Add Movie</button>
          </div>
        </form>
      </div>
</div>

  </div>
</div>
          
          

                    


    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>