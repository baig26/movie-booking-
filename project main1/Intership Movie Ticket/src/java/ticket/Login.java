/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ticket;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Aatifulla Baig
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

     /**
      * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
      * methods.
      *
      * @param request servlet request
      * @param response servlet response
      * @throws ServletException if a servlet-specific error occurs
      * @throws IOException if an I/O error occurs
      */
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException, ClassNotFoundException, SQLException {
         response.setContentType("text/html;charset=UTF-8");

             try (PrintWriter out = response.getWriter()) {

                 /* TODO output your page here. You may use following sample code. */
                 out.println("<!DOCTYPE html>");
                 out.println("<html>");
                 out.println("<head>");
                 out.println("<title>Servlet Login</title>");
                 out.println("</head>");
                 out.println("<body>");

             String user_id = request.getParameter("username");
     String user_pw = request.getParameter("password");

     // Check if user exists in database
     Connection con = Connect.initializeDatabase();
     String query = "SELECT * FROM user WHERE user_name=? AND user_pw=?";
     PreparedStatement ps = con.prepareStatement(query);
     ps.setString(1, user_id);
     ps.setString(2, user_pw);
     ResultSet rs = ps.executeQuery();

    if (rs.next()) {
    // User exists, redirect to UserDash.jsp
response.sendRedirect("UserDash.jsp?username=" + user_id);
} else {
    // User does not exist, show alert message and redirect to Login.html
    String message = "Invalid username or password. Please try again, or register if you're a new user.";
    HttpSession session = request.getSession();
    session.setAttribute("message", message);
    response.sendRedirect("login.jsp");
}






             con.close();


     //This code checks if the user exists in the database using a SELECT query. If the user exists, it redirects to the UserDash.jsp page, otherwise it redirects to the Registration.html page.






                 out.println("</body>");
                 out.println("</html>");
             }
         }
     // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
     /**
      * Handles the HTTP <code>GET</code> method.
      *
      * @param request servlet request
      * @param response servlet response
      * @throws ServletException if a servlet-specific error occurs
      * @throws IOException if an I/O error occurs
      */
     @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {
          try {
               processRequest(request, response);
          } catch (ClassNotFoundException ex) {
               Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
          } catch (SQLException ex) {
               Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
          }
     }

     /**
      * Handles the HTTP <code>POST</code> method.
      *
      * @param request servlet request
      * @param response servlet response
      * @throws ServletException if a servlet-specific error occurs
      * @throws IOException if an I/O error occurs
      */
     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {
          try {
               processRequest(request, response);
          } catch (ClassNotFoundException ex) {
               Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
          } catch (SQLException ex) {
               Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
          }
     }

     /**
      * Returns a short description of the servlet.
      *
      * @return a String containing servlet description
      */
     @Override
     public String getServletInfo() {
          return "Short description";
     }// </editor-fold>

}
