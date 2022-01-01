package service.employee;

import bean.*;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeServiceImpl {
    List<Employee> employeeList();

    void createEmployee(Employee employee) throws SQLException;

    List<Position> positionList();
    List<EducationDegree> educationDegree();
    List<Division> divisionList();
    List<User> userList();
}
