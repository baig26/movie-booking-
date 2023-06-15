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
@WebServlet(name = "Book", urlPatterns = {"/Book"})
public class Book extends HttpServlet {

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
            out.println("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\n"
                    + "");
            out.println("        <link rel=\"stylesheet\" href=\"Style.css\">\n"
                    + "");
            out.println("<title>Servlet Book</title>");
            out.println("</head>");
            out.println("<body>");
            
            String Movie = request.getParameter("Movie_Name");
            String theater = request.getParameter("theatre");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            int tickets = Integer.parseInt(request.getParameter("tickets"));
            int amt =Integer.parseInt(request.getParameter("amt"));
//            int uid = Integer.parseInt(request.getParameter("uid"));

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
            String sql1 = "insert into userbooking  values(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql1);
            ps.setString(1, Movie);
            ps.setString(2, theater);
            ps.setString(3, date);
            ps.setString(4, time);
            ps.setInt(5, tickets);
            ps.setDouble(6, amt);
//            ps.setInt(7, uid);
            int i = ps.executeUpdate();
            if (i > 0) {
               out.println("<div class=\"card box\" style=\"width: 50rem;\">"
    + "<div class=\"card-body\">"
    + "<div class=\"modal-header\">"
    + "<h5 class=\"card-title head\">Movie Ticket Booking-Reciept</h5>"
    + "<button type=\"button\" class=\"close\" onclick=\"location.href='UserDash.jsp'\">"
    + "<span aria-hidden=\"true\">&times;</span>"
    + "</button>"
    + "</div>"
    + "<p class=\"card-text\"><label class=\"labels\">Movie Name</label><p class=\"names\">" + Movie + "</p><label>Theater Name</label>:<p class=\"names\">" + theater + "</p><label>Date</label>:<p class=\"names\">" + date + "</p><label>Time</label>:<p class=\"names\">" + time + "</p><label>No Of Tickets</label>:<p class=\"names\">" + tickets + "</p><label>Total Fare</label>:<p class=\"names\">" + amt + "</p></p>"
    + "<a href=\"#\" class=\"btn btn-success\" onclick=\"window.print()\">Print</a>"
    + "</div>"
    + "</div>");

//                out.println("<p>Total Fare " + amt + "</p>");
            }
            ps.close();
            con.close();

            out.println(" <script src=\"https://code.jquery.com/jquery-3.2.1.slim.min.js\" integrity=\"sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN\" crossorigin=\"anonymous\"></script>\n"
                    + "<script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script>\n"
                    + "<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"></script>\n"
                    + "");
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
               Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
          } catch (SQLException ex) {
               Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
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
               Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
          } catch (SQLException ex) {
               Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
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
