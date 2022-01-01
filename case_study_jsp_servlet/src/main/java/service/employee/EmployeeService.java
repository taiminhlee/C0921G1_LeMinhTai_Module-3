package service.employee;

import bean.*;
import repository.employee.EmployeeRepository;
import repository.employee.EmployeeRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class EmployeeService implements EmployeeServiceImpl{
    EmployeeRepositoryImpl employeeRepository =new EmployeeRepository();


    @Override
    public List<Employee> employeeList() {

        return employeeRepository.employeeList();
    }

    @Override
    public void createEmployee(Employee employee) throws SQLException {
        employeeRepository.createEmployee(employee);
    }

    @Override
    public List<Position> positionList() {
        return employeeRepository.positionList();
    }

    @Override
    public List<EducationDegree> educationDegree() {
        return employeeRepository.educationDegree();
    }

    @Override
    public List<Division> divisionList() {
        return employeeRepository.divisionList();
    }

    @Override
    public List<User> userList() {
        return employeeRepository.userList();
    }
}
