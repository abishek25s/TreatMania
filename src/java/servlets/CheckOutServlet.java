package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/checkout")
public class CheckOutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double total = Double.parseDouble(request.getParameter("total"));

        request.setAttribute("total", total);

        // Forward the request to the checkout.jsp page
        request.getRequestDispatcher("/checkOut.jsp").forward(request, response);
    }
}
