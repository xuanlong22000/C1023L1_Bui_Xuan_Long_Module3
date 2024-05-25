package vn.codegym.case_study_servlet.service;

import vn.codegym.case_study_servlet.model.Customer;
import vn.codegym.case_study_servlet.repository.CustomerRepository;
import vn.codegym.case_study_servlet.repository.CustomerRepositoryImpl;

import java.util.List;

public class CustomerServiceImpl implements CustomerService {
    CustomerRepository customerRepository = new CustomerRepositoryImpl();

    @Override
    public List<Customer> findAll(int offset, int noOfRecords) {
        return customerRepository.findAll(offset, noOfRecords);
    }

    @Override
    public int getNoOfRecords() {
        return customerRepository.getNoOfRecords();
    }

    @Override
    public void save(Customer customer) {
        customerRepository.save(customer);
    }

    @Override
    public List findByName(String name) {
        return null;
    }

    @Override
    public void update(int id, Customer customer) {
        customerRepository.update(id,customer);
    }
    @Override
    public Customer detail(int id) {
        return customerRepository.detail(id);
    }
    @Override
    public void remove(int id) {
        customerRepository.remove(id);
    }
}
