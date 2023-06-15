/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ticket;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aatifulla Baig
 */
@WebServlet(name = "Registration1", urlPatterns = {"/Registration1"})
public class Registration1 extends HttpServlet {

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
             throws ServletException, IOException, ClassNotFoundException {
          response.setContentType("text/html;charset=UTF-8");
          try (PrintWriter out = response.getWriter()) {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String numberString = request.getParameter("number");
    String email = request.getParameter("email");

    int number = 0;
    if (numberString != null && !numberString.isEmpty()) {
        number = Integer.parseInt(numberString);
    } else {
        // handle the case where the number is null or empty
    }

    try {
         Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
                        String sql = "insert into user values (?,?,?,?)";
                        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);
ps.setString(3, String.valueOf(number));
        ps.setString(4, email);
        int rowsInserted = ps.executeUpdate();
        if (rowsInserted > 0) {
            response.sendRedirect("UserDash.jsp");
        } else {
            response.sendRedirect("Registration.jsp?error=1");
        }
        con.close();
    } catch (SQLException | ClassNotFoundException | IOException e) {
    }
    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<title>Servlet Registration1</title>");               
    out.println("</head>");
    out.println("<body>");
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
              Logger.getLogger(Registration1.class.getName()).log(Level.SEVERE, null, ex);
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
              Logger.getLogger(Registration1.class.getName()).log(Level.SEVERE, null, ex);
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
