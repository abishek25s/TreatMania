package servlets;
// MenuServlet.java
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.annotation.WebServlet;


@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new ServletException("Error loading MySQL JDBC Driver", e);
        }
        List<MenuItem> menuItems = new ArrayList<>();
        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
        
        // Connect to the database
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/treatmania", "tm_admin", "12345678")) {
            // Prepare SQL query
            String sql = "SELECT * FROM menu_items WHERE restaurant_id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, restaurantId);

            // Execute query
            ResultSet resultSet = statement.executeQuery();

            // Process results
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");                
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                String imageUrl = resultSet.getString("image_url");

                // Create MenuItem object
                MenuItem menuItem = new MenuItem(id, name, description, price, imageUrl);
                menuItems.add(menuItem);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println(ex.getMessage());
        }

        // Set attribute and forward to JSP
        request.setAttribute("menuItems", menuItems);
        request.getRequestDispatcher("/order.jsp").forward(request, response);
    }
}
