<%-- 
    Document   : Userbooking
    Created on : 8 Jun, 2023, 1:20:37 PM
    Author     : Aatifulla Baig
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Booking</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <!-- Bootstrap JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

        <style>
    body {
        background-color: #f2f2f2;
        font-family: Arial, sans-serif;
    }

    .modal {
        display: block;
        position: fixed;
        z-index: 9999;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5);
    }

    .modal-dialog {
        margin: 10% auto;
        width: 50%;
        min-height: 200px;
        border: none;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.5);
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .modal-header {
        padding: 15px;
        background-color: #f44336;
        color: #fff;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }

    .modal-body {
        padding: 20px 40px;
    }

    .input-group {
        margin-bottom: 20px;
    }

    .input-group label {
        font-weight: bold;
    }

    .dropdown-title {
        margin-bottom: 0;
    }

    select.custom-select {
        width: auto;
        margin-right: 20px;
    }

    .btn {
        background-color: #4CAF50;
        color: #fff;
        border: none;
        border-radius: 5px;
        padding: 10px;
        cursor: pointer;
        margin-top: 10px;
    }

    .btn:hover {
        background-color: #3e8e41;
    }
</style>

    </head>
    <body>
        <%  try {
                String user_id = request.getParameter("username");
                String Movie_name=request.getParameter("movie");
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
        <div class="modal" id="bookTicketModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" data-target="#bookTicketModal">
    <span aria-hidden="true">&times;</span>
</button>



            </div>
            <div class="modal-body">
                <div class="pt-3">
                    <center>
                        <b>
                            <p>User Name:<h5 class="dropdown-title"><%=rs.getString("user_name")%></h5>
                              
                            </p>
                        </b>
                    </center>

                    <form method="post" action="confirmBooking.jsp?user_name=<%=user_name%>">
                        <div class="input-group mb-3">
                            <label class="mr-3">Movie name</label>
                            <input type="hidden" id="movieName" name="Movie_Name" value="<%= Movie_name%>" required="">
                            <span><%= Movie_name%></span>
                        </div>

                       <div class="input-group mb-3">
    <label class="mr-3">Theater name</label>
    <select class="custom-select" id="inputGroupSelect04" name="theatre" required="">
        <option selected>Choose...</option>
        <% 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //step 2 connect to database
            String sql3 = "SELECT DISTINCT theater_name FROM show1 WHERE movie_name=?";
            PreparedStatement ps5 = con.prepareStatement(sql3);
            ps5.setString(1, Movie_name);
            ResultSet rs3 = ps5.executeQuery();
            while (rs3.next()) { 
                String theater_name = rs3.getString("theater_name");
        %>
        <option value="<%= theater_name %>"><%= theater_name %></option>
        <% 
            }
        } catch (Exception e) { 
            e.printStackTrace();
        } 
        %>
    </select>
</div>


<div class="input-group mb-3">
    <label class="mr-3">Select Date</label>
    <input type="date" name="date" required="">
</div>

<div class="input-group mb-3">
    <label class="mr-3">Select Time</label>
    <select class="custom-select" id="inputGroupSelect04" name="time" required="">
        <option selected>Choose...</option>
        <% 
             String theater_name = request.getParameter("theater_name");
             out.println("hello" + theater_name);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //step 2 connect to database
            String sql4 = "SELECT show_time FROM show1 WHERE movie_name=? ";
            PreparedStatement ps6 = con.prepareStatement(sql4);
            ps6.setString(1, Movie_name);
//            ps6.setString(2,request.getParameter("theatre"));
            ResultSet rs4 = ps6.executeQuery();
            while (rs4.next()) { 
        %>
        <option value="<%= rs4.getString("show_time") %>"><%= rs4.getString("show_time") %></option>
        <% 
            }
        } catch (Exception e) { 
            e.printStackTrace();
        } 
        %>
    </select>
</div>


                        <div class="input-group mb-3">
                            <label class="mr-3">No. of Seats</label>
                            <select class="custom-select" id="inputGroupSelect04" name="tickets" required="">
                                <option selected>Choose...</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                        </div>
                    
                        <div class="input-group">
                            <input type="submit" class="btn btn-success ml-3" value="Book">
                            
                      

                        
                        </div>
</form> 
                </div>
            </div>
        </div>
        </div>
    </div>
   
  
    <%
                                   }
                                   } catch (Exception e) {
                                    }
                                %>


</body>
</html>
