<%-- 
    Document   : AdminDashboards
    Created on : 8 Jun, 2023, 1:15:30 PM
    Author     : Aatifulla Baig
--%>

<%@page import="java.util.UUID"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
     <head>
          <title>AdminDashboard</title>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
          <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
          <link rel="stylesheet" href="design.css">


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
                    left: 18rem;
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

               .modal-header {
                    background-color: silver;
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
     </head>
     <body>
          <!--         <script>
          $(document).ready(function() {
            $('#addMovieModal').on('show.bs.modal', function (event) {
              var button = $(event.relatedTarget); // Button that triggered the modal
              var theaterId = button.data('theaterid'); // Extract info from data-* attributes
              var modal = $(this);
              modal.find('input[name="theater_id"]').val(theaterId); // Populate hidden input field with theater id
            });
          });
          </script>-->

          <%

               response.setHeader("Cache-Control", "no-cache,no-store");


          %>

          <section>
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
                                        <i class="fa fa-user-circle-o fa-lg"></i>
                                   </a>
                                   <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="AddMovThe.jsp">
                                             <i class="fa fa-plus-circle"></i> Add Movie
                                        </a>
                                        <a class="dropdown-item" href="AdminCustomer.jsp">
                                             <i class="fa fa-history"></i>
                                             Customer Booked
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
                                   <a href='Adminlogin.jsp' class="btn btn-success">Logout</a>
                              </div>
                         </div>
                    </div>
               </div>
          </section>



          <section>
               <br>
               <br>

               <div class="container">
                    <div class="row">
                         <%             // establish database connection
                              Class.forName("com.mysql.jdbc.Driver");
                              Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
                              Statement stmt = conn.createStatement();
                              ResultSet rs = stmt.executeQuery("SELECT * FROM theater");
                              // iterate through each row of the theater table
                              while (rs.next()) {
                                   // retrieve theater data from the current row
                                   String theaterName = rs.getString("theater_name");
                                   String address = rs.getString("address");
                                   String poster = rs.getString("theater_poster");

                         %>
                         <div class="col-sm-4">
                              <div class="card mb-3">
                                   <img class="card-img-top" src="<%= poster%>" alt="<%=poster%> Poster">                   
                                   <div class="card-body">
                                        <center>
                                             <h5 class="card-title"><%=theaterName%></h5>
                                             <p class="card-text"><%=address%></p>                  
                                             <a href="theater-details.jsp?theaterName=<%=theaterName%>" class="btn btn-primary" >view details</a>
                                        </center>
                                   </div>
                              </div>
                         </div>
                         <br>
                         <%
                              }
                              // close database connection
                              rs.close();
                              stmt.close();
                              conn.close();
                         %>
                    </div>
               </div>
          </section>




          <!-- Button trigger modal -->



          <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
          <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

     </body>
</html>
