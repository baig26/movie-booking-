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
@WebServlet(name = "AdminLogin", urlPatterns = {"/AdminLogin"})
public class AdminLogin extends HttpServlet {

     /**
      * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
      * methods.
      *
      * @param request servlet request
      * @param response servlet response
      * @throws ServletException if a servlet-specific error occurs
      * @throws IOException if an I/O error occurs
      * @throws java.lang.ClassNotFoundException
      * @throws java.sql.SQLException
      */
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminLogin</title>");
            out.println("</head>");
            out.println("<body>");
            String admin_user = request.getParameter("admin_user");
            String admin_pw = request.getParameter("admin_pw");
            String query = "SELECT * FROM admin WHERE admin_name=? and admin_pw=?";
            Connection con = Connect.initializeDatabase();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, admin_user);
            ps.setString(2, admin_pw);
            ResultSet rs = ps.executeQuery();

    if (rs.next()) {
    // User exists, redirect to UserDash.jsp
    response.sendRedirect("AdminDashboards.jsp");
} else {
    // User does not exist, show alert message and redirect to Login.html
    String message = "Invalid username or password. Please try again, or register if you're a new user.";
    HttpSession session = request.getSession();
    session.setAttribute("message", message);
    response.sendRedirect("Adminlogin.jsp");
}

            con.close();
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
               Logger.getLogger(AdminLogin.class.getName()).log(Level.SEVERE, null, ex);
          } catch (SQLException ex) {
               Logger.getLogger(AdminLogin.class.getName()).log(Level.SEVERE, null, ex);
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
               Logger.getLogger(AdminLogin.class.getName()).log(Level.SEVERE, null, ex);
          } catch (SQLException ex) {
               Logger.getLogger(AdminLogin.class.getName()).log(Level.SEVERE, null, ex);
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
