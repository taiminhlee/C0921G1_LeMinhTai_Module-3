package repository.employee;

import bean.*;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements EmployeeRepositoryImpl{
    Connection conn= BaseRepository.connection;
    ResultSet rs=null;
    final String INSERT_EMPLOYEE="insert into employee (employee_name, employee_birthday, employee_id_card, employee_salary, employee_phone,\n" +
            " employee_email, employee_address, position_id, education_degree_id, division_id, employee_status)\n" +
            " value\n" +
            " (?,?,?,?,?,?,?,?,?,?,?)";
    final String SELECT_EMPLOYEE="  select employee_id, employee_name, employee_birthday, employee_id_card, employee_salary, employee_phone\n" +
            " employee_email, employee_address, position_name, education_degree_name, division_name, user_name, employee_status\n" +
            " from employee as em\n" +
            " join position po on em.position_id=po.position_id\n" +
            " join education_degree edu on em.education_degree_id=edu.education_degree_id\n" +
            " join division di on em.division_id=di.division_id;";

    @Override
    public  List<Employee> employeeList() {
        List<Employee> employees=new ArrayList<>();
        try {
            PreparedStatement pr=conn.prepareStatement(SELECT_EMPLOYEE);
            System.out.println(pr);
            rs=pr.executeQuery();
            while (rs.next()) {
                if (rs.getString("employee_status").equals("1")){
                    int id = rs.getInt("employee_id");
                    String name = rs.getString("employee_name");
                    String birthday = rs.getString("employee_birthday");
                    String idCard = rs.getString("employee_id_card");
                    double salary =rs.getDouble("employee_salary");
                    String phone = rs.getString("employee_phone");
                    String email = rs.getString("employee_email");
                    String address = rs.getString("employee_address");
                    String division =rs.getString("division");
                    String position = rs.getString("position_name");
                    String educationDegree = rs.getString("education_degree_name");
                    String user=rs.getString("user_name");
                    employees.add(new Employee(id, name, birthday, idCard,salary,phone,email,address,position,educationDegree,division,user));
                }

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employees;
    }

    @Override
    public List<Position> positionList() {
        List<Position> positions=new ArrayList<>();
        try {
            PreparedStatement pr=conn.prepareStatement("select * from position");
            System.out.println(pr);
            rs=pr.executeQuery();
            while (rs.next()){
                int typeId=rs.getInt("position_id");
                String typeName=rs.getString("position_name");
                positions.add(new Position(typeId,typeName));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return positions;
    }

    @Override
    public List<Division> divisionList() {
        List<Division> divisions=new ArrayList<>();
        try {
            PreparedStatement pr=conn.prepareStatement("select * from division");
            System.out.println(pr);
            rs=pr.executeQuery();
            while (rs.next()){
                int typeId=rs.getInt("division_id");
                String typeName=rs.getString("division_name");
                divisions.add(new Division(typeId,typeName));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return divisions;
    }

    @Override
    public List<EducationDegree> educationDegree() {
        List<EducationDegree> educationDegrees=new ArrayList<>();
        try {
            PreparedStatement pr=conn.prepareStatement("select * from education_degree");
            System.out.println(pr);
            rs=pr.executeQuery();
            while (rs.next()){
                int typeId=rs.getInt("education_degree_id");
                String typeName=rs.getString("education_degree_name");
                educationDegrees.add(new EducationDegree(typeId,typeName));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return educationDegrees;
    }

    @Override
    public List<User> userList() {
        List<User> users=new ArrayList<>();
        try {
            PreparedStatement pr=conn.prepareStatement("select * from `user`");
            System.out.println(pr);
            rs=pr.executeQuery();
            while (rs.next()){
                String userName=rs.getString("user_name");
                String password=rs.getString("user_password");
                users.add(new User(userName,password));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return users;
    }

    @Override
    public void createEmployee(Employee employee) throws SQLException {
        System.out.println(INSERT_EMPLOYEE);
        try ( PreparedStatement preparedStatement = conn.prepareStatement(INSERT_EMPLOYEE)) {
            preparedStatement.setString(1, employee.getEmployeeName());
            preparedStatement.setString(2, employee.getEmployeeBirthday());
            preparedStatement.setString(3,  employee.getEmployeeIdCard());
            preparedStatement.setDouble(4,  employee.getEmployeeSalary());
            preparedStatement.setString(5, employee.getEmployeePhone());
            preparedStatement.setString(6, employee.getEmployeeEmail());
            preparedStatement.setString(7, employee.getEmployeeAddress());
            preparedStatement.setString(8, employee.getPosition());
            preparedStatement.setString(9, employee.getEducationDegree());
            preparedStatement.setString(10, employee.getDivision());
            preparedStatement.setInt(11, 1);
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

    public static void main(String[] args) {
        EmployeeRepository employeeRepository=new EmployeeRepository();
        for (Position position:employeeRepository.positionList()) {
            System.out.println(position);
        }
    }
}
