import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculateServlet", value = "/calculate")
public class CalculateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String display;

        try {
            float firstOperand = Integer.parseInt(request.getParameter("first-operand"));
            float secondOperand = Integer.parseInt(request.getParameter("second-operand"));
            char operator = request.getParameter("operator").charAt(0);
            float result = Calculate.calculate(firstOperand, secondOperand, operator);
            display = (firstOperand + " " + operator + " " + secondOperand + " = " + result);
        } catch (Exception ex) {
            display = ("Error: " + ex.getMessage());
        }
        request.setAttribute("display", display);
        request.getRequestDispatcher("/display.jsp").forward(request, response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
