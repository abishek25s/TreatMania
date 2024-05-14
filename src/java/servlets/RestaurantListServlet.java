package servlets;
// RestaurantListServlet.java
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.annotation.WebServlet;

@WebServlet("/restaurantList")
public class RestaurantListServlet extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new ServletException("Error loading MySQL JDBC Driver", e);
        }
        List<Restaurant> restaurantList = new ArrayList<>();
        Connection conn = null;
        try {
            // Establish database connection (you'll need to replace these credentials with your own)
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/treatmania", "tm_admin", "12345678");

            // Query to retrieve restaurant data
            String sql = "SELECT * FROM restaurants";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            // Process result set
            while (resultSet.next()) {
                Restaurant restaurant = new Restaurant();
                restaurant.setId(resultSet.getInt("id"));
                restaurant.setName(resultSet.getString("name"));
                restaurant.setCuisineType(resultSet.getString("cuisine_type"));
                restaurant.setImageUrl(resultSet.getString("image_url"));
                restaurantList.add(restaurant);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Set restaurantList as an attribute in the request object
        request.setAttribute("restaurantList", restaurantList);

        // Forward the request to the JSP page for rendering
        RequestDispatcher dispatcher = request.getRequestDispatcher("/restaurants.jsp");
        dispatcher.forward(request, response);
    }
}
