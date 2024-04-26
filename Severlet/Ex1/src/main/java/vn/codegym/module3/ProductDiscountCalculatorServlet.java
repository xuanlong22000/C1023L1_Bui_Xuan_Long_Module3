package vn.codegym.module3;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ProductDiscountCalculatorServlet", value = "/product-discount-calculator-servlet")
public class ProductDiscountCalculatorServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String ProductDescription = request.getParameter("ProductDescription") ;
        double ListPrice = Double.parseDouble(request.getParameter("ListPrice")) ;
        double DiscountPercent = Double.parseDouble(request.getParameter("DiscountPercent")) ;

        double result = ListPrice * DiscountPercent * 0.01 ;
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        out.println("<html><head>" + "<title>Result</title>" +"</head<body>");

        out.println("<h1>" + result + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}
