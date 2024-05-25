package vn.codegym.case_study_servlet.repository;

import vn.codegym.case_study_servlet.model.Customer;

import java.util.List;

public interface CustomerRepository {
    public Customer detail(int id);
    List<Customer> findAll(int offset, int noOfRecords);
    int getNoOfRecords();

    void save(Customer customer);

    List findByName(String name);

    void update(int id, Customer customer);

    void remove(int id);
}
