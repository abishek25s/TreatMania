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

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Here you can retrieve the items from the user's cart (e.g., from session) and pass them to the JSP for display
        // For demonstration purposes, let's assume the cart items are stored in the session attribute named "cart"
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        // Calculate subtotal
        double subtotal = 0;
        for (CartItem item : cart) {
            subtotal += item.getPrice();
        }

        // Calculate total (subtotal + delivery fee)
        double total = subtotal + 50;

        // You can forward the request to the cart JSP and pass the cart items and calculated values as attributes
        request.setAttribute("cartItems", cart);
        request.setAttribute("subtotal", subtotal);
        request.setAttribute("total", total);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }
}
