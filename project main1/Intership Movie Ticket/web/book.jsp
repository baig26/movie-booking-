<%-- 
    Document   : book
    Created on : 8 Jun, 2023, 1:21:27 PM
    Author     : Aatifulla Baig
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
	<title>Booking Details</title>
	<style>
		/* CSS styles for ticket formatting */
		.ticket {
			border: 2px solid #ddd;
			padding: 20px;
			width: 400px;
			height: 400px;
			margin: 50px auto;
			text-align: center;
			font-family: Arial, sans-serif;
			background-color: #f5f5f5;
			box-shadow: 0px 0px 10px 2px rgba(0, 0, 0, 0.1);
		}

		.movie-title {
			font-size: 36px;
			font-weight: bold;
			margin-bottom: 20px;
		}

		.booking-info {
			font-size: 24px;
			margin-bottom: 20px;
		}

		.print-btn {
			margin-top: 30px;
			display: flex;
			justify-content: space-between;
		}

		button {
			background-color: #008CBA;
			color: white;
			padding: 10px 20px;
			border-radius: 5px;
			border: none;
			font-size: 20px;
			cursor: pointer;
			transition: all 0.3s ease-in-out;
		}

		button:hover {
			transform: scale(1.05);
		}

		button:active {
			transform: scale(0.95);
		}
	</style>
</head>
<body>
	<h1 style="text-align: center;">Booking Details</h1>
	
	<%

             String user_name = request.getParameter("user_name");
             String movieName = request.getParameter("Movie_Name");
             String screen_no = request.getParameter("screen_no");

String theatreName = request.getParameter("theatre");
String date = request.getParameter("date");
String time = request.getParameter("time");
int tickets = Integer.parseInt(request.getParameter("tickets"));
double amt = Double.parseDouble(request.getParameter("amt"));

                  
		/* Get the current date and time */
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date now = new Date();
		String dateTimeStr = dateFormat.format(now);
		
		/* Insert the booking details into the database */
		try {
			// Set up the database connection
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
			
			// Prepare the SQL statement to insert the booking details
			String query = "INSERT INTO userbooking(user_name, movies_name, theater,screen_no, tickets, date, time, fare)  VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(query);
                           pstmt.setString(1, user_name);
			pstmt.setString(2, movieName);
			pstmt.setString(3, theatreName);
                           pstmt.setString(4, screen_no);
                           pstmt.setInt(5, tickets);
			pstmt.setString(6, date);
			pstmt.setString(7, time);
			pstmt.setDouble(8, amt);

                           

			
			
			// Execute the SQL statement
pstmt.executeUpdate();

// Close the database connection
con.close();

} catch (Exception e) {
    out.print("Error: " + e.getMessage());
    e.printStackTrace();
}

			//




		/* Retrieve the booking details from the request object */
		
	%>
	
	<div class="ticket">
              	<div class="movie-title"><%= user_name %></div>
		<div class="movie-title"><%= movieName %></div>
		<div class="booking-info"><%= theatreName %> - <%= date %> <%= time %></div>
		<div class="booking-info"><%= tickets %> Tickets</div>
		<div class="booking-info">Total Amount: <%= amt %></div>
		<div class="booking-info">Booked on: <%= dateTimeStr %></div>
		
		<div class="print-btn">
			<button onclick="window.print()">Print Ticket</button>
			<button onclick="window.location.href='UserDash.jsp?username=<%=user_name%>'">Go Back</button>
		</div>
	</div>
</body>
</html>
