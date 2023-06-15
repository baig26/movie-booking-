<%-- 
    Document   : Customerdetails
    Created on : 8 Jun, 2023, 1:16:59 PM
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
            .navbar{
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
              <%  try {
                             String user_id = request.getParameter("user_name");
                                    Class.forName("com.mysql.jdbc.Driver");
                                    //step 2 connect to database
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
                                    String sql = "select * from user where user_name=?";
                                    PreparedStatement ps3 = con.prepareStatement(sql);
                                    ps3.setString(1, user_id);
                                    ResultSet rs = ps3.executeQuery();
                                if (!rs.next()) {
        out.println("<h3 class=\"head\">ERROR</h3>");
    } else {%>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <ul class="navbar-nav ml-auto">
  <li class="nav-item">
    <a class="nav-link" href="UserDash.jsp?username=<%= user_id %>">
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
                  <img src="<%=rs.getString("photo")%>" class="img-fluid rounded-circle" style="height: 30px; width: 30px;">
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <div class="dropdown-header">
                      <center>
                          <img src="<%=rs.getString("photo")%>" class="img-fluid rounded-circle" style="height: 80px; width: 80px;">
                          <h5 class="dropdown-title"><%=rs.getString("user_name")%></h5>
                          <p class="dropdown-subtitle"><%=rs.getString("email")%></p>
                          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#exampleModal">
                              <i class="fa fa-sign-out"></i>
                              Logout
                          </a>
                      </center>
                  </div>
              </div>
          </li>
      </ul>
  </div>
</nav>

<style>
  .circle {
    width: 40px;
    height: 40px;
    background-color: #fff;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .circle i {
    font-size: 20px;
    color: #000;
  }
  
  .modal-header {
  background-color: #333;
  color: #fff;
  text-align: center;
  font-weight: bold;
  padding: 1rem;
}

.modal-body {
  font-size: 18px;
}

.modal-footer {
  background-color: #f5f5f5;
  text-align: center;
}

.modal-footer button {
  margin-right: 10px;
}

.btn-success {
  background-color: #28a745;
  border-color: #28a745;
}

.btn-success:hover {
  background-color: #218838;
  border-color: #1e7e34;
}

.btn-secondary {
  background-color: #6c757d;
  border-color: #6c757d;
}

.btn-secondary:hover {
  background-color: #5a6268;
  border-color: #545b62;
}

</style>


        
  
                                <%
                                   }
                                   } catch (Exception e) {
                                    }
                                %>

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
        <%
            try {
             String user_name = request.getParameter("user_name");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
                String sql = "select * from userbooking WHERE user_name=?";
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setString(1, user_name);
                ResultSet rs = stmt.executeQuery();
                if (rs.next() == false) {
                    out.println("<h3 class=\"head\">no records found</h3>");
                } else {
                     
        %>
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">user_name</th>
                    <th scope="col">movie_name</th>
                    <th scope="col">theater_name</th>
                    <th scope="col">no_of_seats</th>
                    <th scope="col">no_of_Tickets</th>
                    <th scope="col">date</th>
                    <th scope="col">show</th>
                    <th scope="col">total_fare</th>
                    <th scope="col">Edit</th>
                    <th scope="col">delete</th>

                </tr>
            </thead>
            <tbody><%
                do { %>
                <tr>
     <td><%= rs.getString(1)%></td>
     <td><%= rs.getString(2)%></td>
                <td><%= rs.getString(3)%></td>
                <td><%= rs.getInt(4)%></td>
                <td><%= rs.getInt(5)%></td>
                <td><%= rs.getDate(6)%></td>
                <td><%= rs.getString(7)%></td>
                <td><%= rs.getDouble(8)%></td>
      <td>
  <a href="#" onclick="openModal('<%= rs.getString(1) %>')" class="btn btn-danger">Edit</a>
</td>


      <td>
         <form method="post" action="delete2.jsp">
    <input type="hidden" name="user_name" value="<%=rs.getString("user_name")%>">
    <input type="hidden" name="user_id" value="<%=rs.getString("user_id")%>">
    <button type="submit" class="btn btn-danger">Delete Movie</button>
</form>

      </td>
      </tr>
            <%} while (rs.next());%>
        </tbody>
        
    </table>
    <!-- Modal -->
<div class="modal fade" id="edit-modal" tabindex="-1" role="dialog" aria-labelledby="edit-modal-label">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="edit-modal-label">Edit Booking Details for <span id="movie-name"></span></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="post" action="update_booking_1.jsp?user_name=<%=user_name%>">
          <input type="hidden" name="Movie_Name" id="movie-name-input" value="">
          <div class="form-group">
               <label for="theater-input">Theater</label>
           <select class="form-control" id="theater-input" name="theatre" required>
               <option selected>Choose...</option>
                    <% try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    //step 2 connect to database
                                    String sql1 = "select * from show1";
                                    Statement stmt2 = con.createStatement();
                                    ResultSet rs2 = stmt2.executeQuery(sql1);
                                 while (rs2.next()) { %>
                                <option><%=rs2.getString(3)%></option>
                                <% } 
                                   } catch (Exception e) { } %>
                            </select>
</div>
          <div class="form-group">
            <label for="date-input">Date</label>
            <input type="date" class="form-control" id="date-input" name="date" required>
          </div>
          
                            <div class="form-group">
               <label for="time-input">Show_Time</label>
           <select class="form-control" id="time-input" name="time" required>
               <option selected>Choose...</option>
                    <% try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    //step 2 connect to database
                                    String sql2 = "select * from show1";
                                    Statement stmt3 = con.createStatement();
                                    ResultSet rs3 = stmt3.executeQuery(sql2);

                                 while (rs3.next()) { %>
                                <option><%=rs3.getString(7)%></option>
                                <% } 
                                   } catch (Exception e) { } %>
                            </select>
</div>

          <div class="form-group">
            <label for="tickets-input">Number of Tickets</label>
            <input type="number" class="form-control" id="tickets-input" name="tickets" required>
          </div>
          
          <button type="submit" class="btn btn-primary">Save Changes</button>
        </form>
      </div>
    </div>
  </div>
</div>
<%}
            } catch (Exception e) {
                e.getStackTrace();
            }%>
<script>
function openModal(movieName) {
  // Open the modal window
  $('#edit-modal').modal('show');
  
  // Set the movie name in the modal window
  $('#movie-name').text(movieName);
  
  // Set the movie name as a value of the hidden input field
  $('#movie-name-input').val(movieName);
}
</script>


            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>     
</html>
