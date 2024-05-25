package vn.codegym.case_study_servlet.controller;

import vn.codegym.case_study_servlet.model.Customer;
import vn.codegym.case_study_servlet.service.CustomerService;
import vn.codegym.case_study_servlet.service.CustomerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "furamaServlet", urlPatterns = {"/furama"})
public class FuramaServlet extends HttpServlet {
    CustomerService customerService = new CustomerServiceImpl();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "customer":
                showListCustomer(req, resp);
                break;
            case "editCustomer":
                showEditCustomer(req, resp);
                break;
            case "service":
                showListService(req, resp);
                break;
            case "employee":
                showListEmployee(req, resp);
                break;
            case "contract":
                showListContract(req, resp);
                break;
            default: //list
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "createCustomer":
                String name = req.getParameter("Name");
                String dob = req.getParameter("DOB");
                String gender = req.getParameter("gender");
                int id_card = Integer.parseInt(req.getParameter("Id_Card"));
                int phoneNumber = Integer.parseInt(req.getParameter("PhoneNumber"));
                String email = req.getParameter("Email");
                String type = req.getParameter("type");
                String address = req.getParameter("Address");
                Customer newCustomer = new Customer(0, name, dob, gender, id_card, phoneNumber, type, email, address);

                customerService.save(newCustomer);
                showListCustomer(req, resp);
                break;
            case "editCustomer":
                int id = Integer.parseInt(req.getParameter("id"));
                String nameEdit = req.getParameter("Name");
                String dobEdit = req.getParameter("DOB");
                String genderEdit = req.getParameter("gender");
                int id_cardEdit = Integer.parseInt(req.getParameter("Id_Card"));
                int phoneNumberEdit = Integer.parseInt(req.getParameter("PhoneNumber"));
                String emailEdit = req.getParameter("Email");
                String typeEdit = req.getParameter("type");
                String addressEdit = req.getParameter("Address");
                Customer editCustomer = new Customer(id, nameEdit, dobEdit, genderEdit, id_cardEdit, phoneNumberEdit, typeEdit, emailEdit, addressEdit);

                customerService.update(id, editCustomer);
                showListCustomer(req, resp);

                break;
            case "deleteCustomer":
                int idDelete = Integer.parseInt(req.getParameter("idCustomer"));

                customerService.remove(idDelete);
                showListCustomer(req, resp);
                break;
            case "searchCustomer":

                System.out.println("voooooo");
                showListCustomer(req, resp);
                break;
            default: //list
        }
    }

    private void showListCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int page = 1;
        int recordsPerPage = 5;
        if (req.getParameter("page") != null)
            page = Integer.parseInt(req.getParameter("page"));
        List<Customer> listCustomer = customerService.findAll(
                (page - 1) * recordsPerPage,
                recordsPerPage);
        int noOfRecords = customerService.getNoOfRecords();
        int noOfPages = (int)Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        req.setAttribute("customerList", listCustomer);
        req.setAttribute("noOfPages", noOfPages);
        req.setAttribute("currentPage", page);
        req.getRequestDispatcher("/furama/customer.jsp").forward(req, resp);
    }

    private void showEditCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        req.setAttribute("customer", customerService.detail(id));
        req.getRequestDispatcher("/furama/editCustomer.jsp").forward(req, resp);
    }

    private void showListEmployee(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.setAttribute("customerList", customerService.findAll());
        req.getRequestDispatcher("/furama/employee.jsp").forward(req, resp);
    }

    private void showListService(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.setAttribute("customerList", customerService.findAll());
        req.getRequestDispatcher("/furama/service.jsp").forward(req, resp);
    }

    private void showListContract(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.setAttribute("customerList", customerService.findAll());
        req.getRequestDispatcher("/furama/service.jsp").forward(req, resp);
    }

    private void showListContractDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.setAttribute("customerList", customerService.findAll());
        req.getRequestDispatcher("/furama/service.jsp").forward(req, resp);
    }
}
