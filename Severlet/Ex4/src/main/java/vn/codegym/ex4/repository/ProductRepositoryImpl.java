package vn.codegym.ex4.repository;

import vn.codegym.ex4.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {
    private static final String SELECT_ALL_PRODUCT = "select * from products";
    private static final String INSERT_PRODUCT = "insert into products(FullName, Price) value(?,?)";
    private static final String DELETE_PRODUCT = "DELETE FROM products WHERE Id = ?";
    private static final String UPDATE_PRODUCT = "UPDATE products SET FullName = ?, Price = ? WHERE Id = ?";

    private List<Product> products = new LinkedList<>();
    @Override
    public List<Product> findAll() {

        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null; //nạp lệnh SQL
        ResultSet resultSet = null; //nhận kq trả về

        products = new LinkedList<>();

        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ALL_PRODUCT);
                resultSet = statement.executeQuery();

                Product product = null;
                while (resultSet.next()) {
//                    int id = resultSet.getInt(1);
                    int id = resultSet.getInt("Id");
                    String name = resultSet.getString("FullName");
                    double price = resultSet.getDouble("Price");

                    product = new Product(id, name, price);
                    products.add(product);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }

        return products;
    }

    @Override
    public void save(Product product) {

        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null; //nạp lệnh SQL

        if (connection != null) {
            try {
                statement = connection.prepareStatement(INSERT_PRODUCT);
                statement.setString(1, product.getName());
                statement.setDouble(2, product.getPrice());

                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException e){
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
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

        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null; //nạp lệnh SQL

        if (connection != null) {
            try {
                statement = connection.prepareStatement(UPDATE_PRODUCT);
                statement.setString(1,product.getName());
                statement.setDouble(2,product.getPrice());
                statement.setInt(3, id);

                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException e){
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public void remove(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null; //nạp lệnh SQL

        if (connection != null) {
            try {
                statement = connection.prepareStatement(DELETE_PRODUCT);
                statement.setInt(1,id);

                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException e){
                    e.printStackTrace();
                }
                DBConnection.close();
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
