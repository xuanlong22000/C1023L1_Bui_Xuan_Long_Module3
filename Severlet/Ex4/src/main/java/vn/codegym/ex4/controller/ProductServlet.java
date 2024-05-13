package vn.codegym.ex4.controller;

import vn.codegym.ex4.model.Product;
import vn.codegym.ex4.service.ProductService;
import vn.codegym.ex4.service.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "productServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreatePage(req, resp);
                break;
            case "edit":
                showEditPage(req,resp);
                break;
            default: //list
                showList(req, resp);
        }
    }

    private void showCreatePage(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
//        resp.sendRedirect("/product/create.jsp");
        req.getRequestDispatcher("/product/create.jsp").forward(req, resp);
    }

    private void showEditPage(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
//        resp.sendRedirect("/product/create.jsp");
        int id = Integer.parseInt(req.getParameter("id"));
        req.setAttribute("product",productService.detail(id));
        req.getRequestDispatcher("/product/edit.jsp").forward(req, resp);
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("productList", productService.findAll());
        req.getRequestDispatcher("/product/list.jsp").forward(req, resp);
    }

    private void showListSearch(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        req.setAttribute("productListSearch", productService.findByName(name));
        req.getRequestDispatcher("/product/search.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        switch (action){
            case "create":
                int id = productService.findAll().size() + 1;
                String name = req.getParameter("name");
                double price = Double.parseDouble(req.getParameter("price"));
                Product product = new Product(id, name, price);
                productService.save(product);
                // resp.sendRedirect("/student");
                showList(req, resp);
            case "delete":
                int idDelete = Integer.parseInt(req.getParameter("id"));

                productService.remove(idDelete);
                showList(req, resp);
            case "edit":
                int idEdit = Integer.parseInt(req.getParameter("id"));
                String nameEdit = req.getParameter("name");
                double priceEdit = Double.parseDouble(req.getParameter("price")) ;

                Product productUpdate = new Product(idEdit,nameEdit,priceEdit);

                productService.update(idEdit,productUpdate);

                showList(req, resp);
            case "find":
                showListSearch(req, resp);
                break;

            default:
                break;
        }
    }

}
