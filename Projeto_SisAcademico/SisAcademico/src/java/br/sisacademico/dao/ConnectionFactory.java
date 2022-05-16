package br.sisacademico.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
 
    private static final String urlDB = "jdbc:derby://localhost:1527/sisacademico_2manha";
    private static final String user = "root";
    private static final String pass = "root";
    
    public static Connection getConnection() throws SQLException{
        DriverManager.registerDriver(new org.apache.derby.jdbc.ClientDriver());
        return DriverManager.getConnection(urlDB, user, pass);
    }
}
