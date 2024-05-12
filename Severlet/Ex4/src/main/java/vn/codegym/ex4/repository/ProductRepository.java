package vn.codegym.ex4.repository;

import vn.codegym.ex4.model.Product;

import java.util.List;

public interface ProductRepository {
    List<Product> findAll();

    void save(Product product);

    List findByName(String name);

    void update(int id, Product product);

    void remove(int id);

    Product detail(int id);
}
