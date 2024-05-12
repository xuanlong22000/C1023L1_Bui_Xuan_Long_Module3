package vn.codegym.ex4.repository;

import vn.codegym.ex4.model.Product;

import java.util.LinkedList;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {

    private List<Product> products = new LinkedList<>();
    @Override
    public List<Product> findAll() {
        return products;
    }

    @Override
    public void save(Product product) {
        products.add(product);
    }

    @Override
    public List findByName(String name) {

        List<Product> dataSearch = new LinkedList<>();

        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getName().contains(name)) {

                dataSearch.add(products.get(i));

            }
        }
        return dataSearch;
    }

    @Override
    public void update(int id, Product product) {
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId() == id) {
                products.get(i).setName(product.getName());
                products.get(i).setPrice(product.getPrice());
            }
        }
    }

    @Override
    public void remove(int id) {
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId() == id) {
                products.remove(products.get(i));
            }
        }
    }

    @Override
    public Product detail(int id) {
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId()==id) {
                return products.get(i);
            }
        }

        return null;
    }
}
