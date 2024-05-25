package vn.codegym.case_study_servlet.repository;

import vn.codegym.case_study_servlet.model.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepository {
    private int noOfRecords;
    private static final String SELECT_ALL_CUSTOMER = "SELECT c.*, ct.customer_type_name FROM customer c LEFT JOIN customer_type ct ON c.customer_type_id = ct.customer_type_id WHERE c.customer_name LIKE" + "%?%" + "LIMIT ?, ?";
    private static final String SELECT_LENGTH_CUSTOMER = "SELECT COUNT(*) FROM customer";
    private static final String SELECT_ONE_CUSTOMER_TO_EDIT = "select * from customer WHERE customer_id = ?";
    private static final String INSERT_CUSTOMER = "insert into customer(" +
            "customer_name, " +
            "customer_birthday, " +
            "customer_gender, " +
            "customer_id_card, " +
            "customer_phone, " +
            "customer_email, " +
            "customer_type_id, " +
            "customer_address) " +
            "value(?,?,?,?,?,?,?,?)";
    private static final String DELETE_CUSTOMER = "DELETE FROM customer WHERE customer_id = ?";
    private static final String UPDATE_CUSTOMER = "UPDATE customer SET " +
            "customer_name = ?, " +
            "customer_birthday = ?," +
            "customer_gender = ?," +
            "customer_id_card = ?," +
            "customer_phone = ?," +
            "customer_email = ?," +
            "customer_type_id=?," +
            "customer_address= ? WHERE customer_id = ?";

    private List<Customer> customers = new LinkedList<>();

    public int getNoOfRecords() { return noOfRecords; }

    @Override
    public List<Customer> findAll(int offset, int noOfRecords) {

        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null; //nạp lệnh SQL
        ResultSet resultSet = null; //nhận kq trả về

        customers = new LinkedList<>();

        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ALL_CUSTOMER);

                statement.setInt(1,offset);
                statement.setInt(2, noOfRecords);

                resultSet = statement.executeQuery();

                Customer customer = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("customer_id");

                    String name = resultSet.getString("customer_name");
                    String birthday = String.valueOf(resultSet.getDate("customer_birthday"));
                    String gender = resultSet.getString("customer_gender");
                    int id_Card = resultSet.getInt("customer_id_card");
                    int phoneNumber = resultSet.getInt("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String type = resultSet.getString("customer_type_name");
                    String address = resultSet.getString("customer_address");

                    customer = new Customer(id, name, birthday, gender, id_Card, phoneNumber, type, email, address);
                    customers.add(customer);

                }

//                Pagination
                resultSet.close();
                statement = connection.prepareStatement(SELECT_LENGTH_CUSTOMER);
                resultSet = statement.executeQuery();
                if (resultSet.next())
                    this.noOfRecords = resultSet.getInt(1);
//                Pagination

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

        return customers;
    }

    @Override
    public void save(Customer customer) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null; //nạp lệnh SQL

        if (connection != null) {
            try {
                statement = connection.prepareStatement(INSERT_CUSTOMER);
                statement.setString(1, customer.getName());
                statement.setString(2, customer.getBirthday());
                statement.setString(3, customer.getGender());
                statement.setInt(4, customer.getId_card());
                statement.setInt(5, customer.getPhone());
                statement.setString(6, customer.getEmail());
                statement.setString(7, customer.getType());
                statement.setString(8, customer.getAddress());

                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public List findByName(String name) {
        return null;
    }

    @Override
    public void update(int id, Customer customer) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null; //nạp lệnh SQL

        if (connection != null) {
            try {
                statement = connection.prepareStatement(UPDATE_CUSTOMER);
                statement.setString(1, customer.getName());
                statement.setString(2, customer.getBirthday());
                statement.setString(3, customer.getGender());
                statement.setInt(4, customer.getId_card());
                statement.setInt(5, customer.getPhone());
                statement.setString(6, customer.getEmail());
                statement.setString(7, customer.getType());
                statement.setString(8, customer.getAddress());
                statement.setInt(9, id);

                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public Customer detail(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null; //nạp lệnh SQL
        ResultSet resultSet = null; //nhận kq trả về

        Customer customer = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ONE_CUSTOMER_TO_EDIT);
                statement.setInt(1, id);

                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    int idCustomer = resultSet.getInt("customer_id");
                    String name = resultSet.getString("customer_name");
                    String birthday = String.valueOf(resultSet.getDate("customer_birthday"));
                    String gender = resultSet.getString("customer_gender");
                    int id_Card = resultSet.getInt("customer_id_card");
                    int phoneNumber = resultSet.getInt("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String type = resultSet.getString("customer_type_id");
                    String address = resultSet.getString("customer_address");

                    customer = new Customer(idCustomer, name, birthday, gender, id_Card, phoneNumber, type, email, address);
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

        return customer;
    }

    @Override
    public void remove(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null; //nạp lệnh SQL

        if (connection != null) {
            try {
                statement = connection.prepareStatement(DELETE_CUSTOMER);
                statement.setInt(1, id);

                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }

    }
}
