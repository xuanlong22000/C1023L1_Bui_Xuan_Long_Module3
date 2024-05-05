package vn.codegym.ex2;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@WebServlet("/customer")
public class CustomerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Customer> customers = new LinkedList<>();

        Customer customer1 = new Customer("long","2029-05-05","213","https://res.cloudinary.com/duoqoiqsg/image/upload/v1656918548/cld-sample-5.jpg");
        Customer customer2 = new Customer("long","2029-05-05","213","https://res.cloudinary.com/duoqoiqsg/image/upload/v1656918548/cld-sample-5.jpg");
        Customer customer3 = new Customer("long","2029-05-05","213","https://res.cloudinary.com/duoqoiqsg/image/upload/v1656918548/cld-sample-5.jpg");
        Customer customer4 = new Customer("long","2029-05-05","213","https://res.cloudinary.com/duoqoiqsg/image/upload/v1656918548/cld-sample-5.jpg");

        customers.add(customer1);
        customers.add(customer2);
        customers.add(customer3);
        customers.add(customer4);

        req.setAttribute("customers", customers);

        RequestDispatcher dispatcher = getServletContext()
                .getRequestDispatcher("/index.jsp");

        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    public void destroy() {
    }
}
