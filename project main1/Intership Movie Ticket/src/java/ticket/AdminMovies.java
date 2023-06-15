/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ticket;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aatifulla Baig
 */
@WebServlet(name = "AdminMovies", urlPatterns = {"/AdminMovies"})
public class AdminMovies extends HttpServlet {

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
             throws ServletException, IOException {
          response.setContentType("text/html;charset=UTF-8");
         try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String Movie_Name = request.getParameter("Movie_Name");
            String theatre = request.getParameter("theatre");
            FileInputStream fis=new FileInputStream("file");
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            String Seat_Qualty = request.getParameter("Seat_Qualty");
            String Discription = request.getParameter("Discription");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
            String sql = "insert into movie values(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, Movie_Name);
            ps.setString(2, theatre);
            ps.setInt(3, capacity);
            ps.setString(4, Seat_Qualty);
            ps.setString(5, Discription);
            ps.setBinaryStream(6,fis,fis.available());
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.getStackTrace();
        }

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


    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
// </editor-fold>
