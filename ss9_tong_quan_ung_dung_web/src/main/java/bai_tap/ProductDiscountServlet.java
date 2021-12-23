package bai_tap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "bai_tap.UngDungProductDiscountServlet", value = "/discount")
public class ProductDiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String listPrice =request.getParameter("list_price");
        String discountPercent =request.getParameter("discount_percent");
        float amount = Float.parseFloat(listPrice) * Float.parseFloat(discountPercent) * 0.01f;
        float result = Float.parseFloat(listPrice)-amount;

        request.setAttribute("result",result);
        request.setAttribute("amount",amount);
        request.getRequestDispatcher("bai_tap/display_product_discount.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("bai_tap/product_discount.jsp").forward(request, response);
    }
}
