/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ticket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Aatifulla Baig
 */
class Connect {
     /**
     *
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public static Connection initializeDatabase() throws ClassNotFoundException, SQLException
  {
       //Step1 Loading the JDBC drives
     Class.forName("com.mysql.jdbc.Driver");
        //Stpe 2 Connecting to the database
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root", "root1234");
        return con;
  }

}