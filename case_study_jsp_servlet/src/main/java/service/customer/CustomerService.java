package service.customer;

import bean.Customer;
import bean.CustomerType;
import repository.customer.CustomerRepository;
import repository.customer.CustomerRepositoryImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerService implements CustomerServiceImpl {
    CustomerRepositoryImpl customerRepository =new CustomerRepository();

    @Override
    public List<Customer> customerList() {
        List<Customer> customers =new ArrayList<>();
        for (Customer customer: customerRepository.customerList()) {
            if (customer.getCustomerGender().equals("1")){
                customer.setCustomerGender("male");
                customers.add(customer);
            }else {
                customer.setCustomerGender("female");
                customers.add(customer);
            }
        }
        return customers;
    }

    @Override
    public void createCustomer(Customer customer) throws SQLException {
        customerRepository.createCustomer(customer);
    }

    @Override
    public List<CustomerType> customerTypeList() {
        return customerRepository.customerTypeList();
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        return customerRepository.updateCustomer(customer);
    }

    @Override
    public Customer selectById(int id) {
        return customerRepository.selectById(id);
    }

    @Override
    public boolean remove(int id) throws SQLException {
        return customerRepository.remove(id);
    }

    @Override
    public List<Customer> selectByName(String name) {
        List<Customer> customers =new ArrayList<>();
        for (Customer customer: customerRepository.selectByName(name)) {
            if (customer.getCustomerGender().equals("1")){
                customer.setCustomerGender("male");
                customers.add(customer);
            }else {
                customer.setCustomerGender("female");
                customers.add(customer);
            }
        }
        return customers;
    }
}
