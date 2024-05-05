package vn.codegym.ex3;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "calculator", value = "/calculator")
public class CalculatorController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double number1 = Double.parseDouble(req.getParameter("firstNum"));
        double number2 = Double.parseDouble(req.getParameter("secondNum"));
        String cal = req.getParameter("cal");

        double result = 0;

        switch (cal){
            case "+":
                result = number1 + number2;
                break;
            case "-":
                result = number1 - number2;
                break;
            case "/":
                result = number1 / number2;
                break;
            case "*":
                result = number1 * number2;
                break;
        }

        resp.setContentType("text/html");

        PrintWriter out = resp.getWriter();
        out.println("<html><head>" + "<title>Result</title>" +"</head<body>");
        out.println("<h1>" + "Result" + "</h1>");
        out.println("<h3>" + result + "</h3>");
        out.println("</body></html>");
    }
}
