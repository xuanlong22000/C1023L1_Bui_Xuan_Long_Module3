package vn.codegym.ex4.service;

import vn.codegym.ex4.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();

    void save(Product product);

    List<Product> findByName(String name);

    void update(int id, Product product);

    void remove(int id);

    Product detail(int id);
}
