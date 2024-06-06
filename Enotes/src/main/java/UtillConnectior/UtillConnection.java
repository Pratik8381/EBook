package UtillConnectior;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import static Constants.Constant.*;

public class UtillConnection {

    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Error loading MySQL JDBC Driver", e);
        }
    }

    public static Connection getCon() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }

    // You can add other utility methods as needed, such as closing resources

    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Handle or log the exception
            }
        }
    }
}