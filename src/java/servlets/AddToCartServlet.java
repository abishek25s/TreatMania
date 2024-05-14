package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get item details from request parameters
        String itemName = request.getParameter("itemName");
        String itemImageUrl = request.getParameter("itemImageUrl");
        double itemPrice = Double.parseDouble(request.getParameter("itemPrice"));
        int quantity = Integer.parseInt(request.getParameter("quantity")); // New: Get quantity
        
        // Create a new CartItem object with quantity
        CartItem cartItem = new CartItem(itemName, itemImageUrl, itemPrice, quantity);
        
        // Here you can implement logic to add the item to the user's cart in the backend (e.g., store in session)
        // For demonstration purposes, let's assume we add the CartItem object to the session attribute named "cart"
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }
        cart.add(cartItem);
        
        // Return success response
        response.getWriter().write("Item added to cart successfully!");
    }
}
