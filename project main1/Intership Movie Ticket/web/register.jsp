<%-- 
    Document   : register
    Created on : 8 Jun, 2023, 1:27:59 PM
    Author     : Aatifulla Baig
--%>

<%@ page import="java.sql.*, java.io.*, java.nio.file.*, java.util.*" %>



<%
    // Get form data
    String username = request.getParameter("username");
System.out.println("Username: " + username);
    String email = request.getParameter("email");
    String contactNumber = request.getParameter("contact_number");
    String password = request.getParameter("password");
    String image = "images/" + request.getParameter("file");

    // Check if passwords match
    
     // Connect to database
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");

        // Insert user data into database
        String sql = "INSERT INTO user (user_name, user_pw, cnum, email, photo) VALUES (?, ?, ?, ?, ?)";
         PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, password);
        stmt.setString(3, contactNumber);
        stmt.setString(4, email);
        stmt.setString(5, image);
        int rowsInserted = stmt.executeUpdate();
        if (rowsInserted > 0) {
response.sendRedirect("UserDash.jsp?username=" + username);
        } else {
            response.sendRedirect("Registration.jsp?error=1");
        }
        conn.close();
    } catch (SQLException ex) {
        out.print("Database error: " + ex.getMessage());
    }
%>