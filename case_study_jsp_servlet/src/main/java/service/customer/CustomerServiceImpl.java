package service.customer;

import bean.Customer;
import bean.CustomerType;

import java.sql.SQLException;
import java.util.List;

public interface CustomerServiceImpl {

    List<Customer> customerList();

    void createCustomer(Customer customer) throws SQLException;

    List<CustomerType> customerTypeList();

    boolean updateCustomer(Customer customer) throws SQLException;

    Customer selectById(int id);

    boolean remove(int id) throws SQLException;

    List<Customer> selectByName(String name);
}
