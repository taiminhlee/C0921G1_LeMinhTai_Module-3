package repository.customer;

import bean.Customer;
import bean.CustomerType;
import repository.BaseRepository;
import repository.customer.CustomerRepositoryImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements CustomerRepositoryImpl {
    Connection conn= BaseRepository.connection;
    ResultSet rs=null;
    final String INSERT_CUSTOMER="insert into customer ( customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address, customer_status)\n" +
            "value\n" +
            "(?,?,?,?,?,?,?,?,?)";
    final String UPDATE_CUSTOMER="update customer set customer_type_id = ?,customer_name= ?, customer_birthday =?,\n " +
            "            customer_gender=?, customer_id_card=?, customer_phone=?, customer_email=?, customer_address=?\n " +
            "             where customer_id = ?;";
    final String SELECT_USER_BY_ID="select customer_id, customer_type_id, customer_name, customer_birthday, customer_gender,\n " +
            "customer_id_card, customer_phone, customer_email, customer_address \n " +
            "from customer\n" +
            "where customer_id=?; ";
    final String DELETE_USERS_SQL="update customer\n " +
            " set customer_status=0\n " +
            " where customer_id=? ";
    final String SELECT_CUSTOMER_BY_NAME="select * from customer\n " +
            "join customer_type ct on customer.customer_type_id=ct.customer_type_id\n " +
            "where customer_name like ? ";

    @Override
    public List<Customer> customerList() {
        List<Customer> customers=new ArrayList<>();
        try {
            PreparedStatement pr=conn.prepareStatement("select * from customer\n" +
                    "join customer_type ct on customer.customer_type_id=ct.customer_type_id;");
            System.out.println(pr);
            rs=pr.executeQuery();
            while (rs.next()) {
                if (rs.getString("customer_status").equals("1")){
                    int id = rs.getInt("customer_id");
                    CustomerType customerType  = new CustomerType(rs.getInt ("customer_type_id"),rs.getString("customer_type_name"));
                    String name = rs.getString("customer_name");
                    String birthday = rs.getString("customer_birthday");
                    String gender = rs.getString("customer_gender");
                    String idCard = rs.getString("customer_id_card");
                    String phone = rs.getString("customer_phone");
                    String email = rs.getString("customer_email");
                    String address = rs.getString("customer_address");
                    customers.add(new Customer(id, customerType, name, birthday,gender,idCard,phone,email,address));
                }

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customers;
    }

    @Override
    public List<CustomerType> customerTypeList() {
        List<CustomerType> customerTypes=new ArrayList<>();
        try {
            PreparedStatement pr=conn.prepareStatement("select * from customer_type");
            System.out.println(pr);
            rs=pr.executeQuery();
            while (rs.next()){
                int typeId=rs.getInt("customer_type_id");
                String typeName=rs.getString("customer_type_name");
                customerTypes.add(new CustomerType(typeId,typeName));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerTypes;
    }

    @Override
    public void createCustomer(Customer customer) throws SQLException {
        System.out.println(INSERT_CUSTOMER);
        try ( PreparedStatement preparedStatement = conn.prepareStatement(INSERT_CUSTOMER)) {
            preparedStatement.setInt(1, customer.getCustomerType().getCustomerTypeId());
            preparedStatement.setString(2, customer.getCustomerName());
            preparedStatement.setString(3,  customer.getCustomerBirthday());
            preparedStatement.setString(4,  customer.getCustomerGender());
            preparedStatement.setString(5, customer.getCustomerIdCard());
            preparedStatement.setString(6, customer.getCustomerPhone());
            preparedStatement.setString(7, customer.getCustomerEmail());
            preparedStatement.setString(8, customer.getCustomerAddress());
            preparedStatement.setInt(9, 1);
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        boolean rowUpdated;
        try ( PreparedStatement statement = conn.prepareStatement(UPDATE_CUSTOMER);) {
            statement.setInt(1, customer.getCustomerType().getCustomerTypeId());
            statement.setString(2, customer.getCustomerName());
            statement.setString(3, customer.getCustomerBirthday());
            statement.setString(4, customer.getCustomerGender());
            statement.setString(5, customer.getCustomerIdCard());
            statement.setString(6, customer.getCustomerPhone());
            statement.setString(7, customer.getCustomerEmail());
            statement.setString(8, customer.getCustomerAddress());
            statement.setInt(9, customer.getCustomerId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    @Override
    public Customer selectById(int id) {
        Customer customer = null;
        try (
                PreparedStatement preparedStatement =conn.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int customerType  = rs.getInt("customer_type_id");
                String name = rs.getString("customer_name");
                String birthday = rs.getString("customer_birthday");
                String gender = rs.getString("customer_gender");
                String idCard = rs.getString("customer_id_card");
                String phone = rs.getString("customer_phone");
                String email = rs.getString("customer_email");
                String address = rs.getString("customer_address");
                customer =(new Customer(id, new CustomerType(customerType), name, birthday,gender,idCard,phone,email,address));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customer;
    }

    @Override
    public boolean remove(int id) throws SQLException {
        boolean rowDeleted;
        try ( PreparedStatement statement = conn.prepareStatement(DELETE_USERS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    @Override
    public List<Customer> selectByName(String str) {
        List<Customer> customers=new ArrayList<>();
        try (
                PreparedStatement preparedStatement =conn.prepareStatement(SELECT_CUSTOMER_BY_NAME)) {
            preparedStatement.setString(1, "%"+str+"%");
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
               if (rs.getString("customer_status").equals("1")){
                   int id=rs.getInt("customer_id");
                   CustomerType customerType  = new CustomerType(rs.getInt ("customer_type_id"),rs.getString("customer_type_name"));
                   String name = rs.getString("customer_name");
                   String birthday = rs.getString("customer_birthday");
                   String gender = rs.getString("customer_gender");
                   String idCard = rs.getString("customer_id_card");
                   String phone = rs.getString("customer_phone");
                   String email = rs.getString("customer_email");
                   String address = rs.getString("customer_address");
                   customers.add(new Customer(id, customerType, name, birthday,gender,idCard,phone,email,address));
               }

            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customers;
    }
}
