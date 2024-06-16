package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signUpServlet")
public class signUpServlet extends HttpServlet {
    // JDBC URL, username, and password of MySQL server
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/treatmania";
    private static final String JDBC_USERNAME = "tm_admin";
    private static final String JDBC_PASSWORD = "12345678";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("Error loading MySQL JDBC Driver");
        }
        // Retrieve user input from signup form
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
            String checkEmailSql = "SELECT * FROM Users WHERE email = ?";
            try (PreparedStatement checkEmailStatement = connection.prepareStatement(checkEmailSql)) {
                checkEmailStatement.setString(1, email);
                try (ResultSet resultSet = checkEmailStatement.executeQuery()) {
                    if (resultSet.next()) {
                        // User with the provided email already exists
                        response.sendRedirect("index.jsp?error=userExists");
                        return; // Exit the method
                    }
                }
            }

            String sql = "INSERT INTO Users (username, email, password) VALUES (?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, username);
                statement.setString(2, email);
                statement.setString(3, password);

                // Execute query
                    int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    // User account created successfully
                    // Redirect user to login page
                    response.sendRedirect("main.jsp");
                } else {
                    // Account creation failed
                    // Redirect user back to signup page with error message
                    response.sendRedirect("index.jsp?error=signupFailed");
                }
            }
        } catch (SQLException e) {
            response.sendRedirect("index.jsp?error=databaseError");
        }
    }

}
