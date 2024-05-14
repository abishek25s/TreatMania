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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
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
            e.printStackTrace();
            throw new ServletException("Error loading MySQL JDBC Driver", e);
        }
        // Retrieve user input from login form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

//         Initialize database connection
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
            // Prepare SQL statement to check user credentials
            String sql = "SELECT * FROM Users WHERE email = ? AND password = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, email);
                statement.setString(2, password);
                
                // Execute query
                try (ResultSet resultSet = statement.executeQuery()) {
                    // Check if user exists
                    if (resultSet.next()) {
                        request.getSession().setAttribute("loggedInUser", email);
                        response.sendRedirect("main.jsp");
                    } else {
                        // Invalid credentials
                        // Redirect user back to login page with error message
                        response.sendRedirect("index.jsp?error=invalidCredentials");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());// Handle potential database errors
            response.sendRedirect("index.jsp?error=databaseError");
        }
    }
}
