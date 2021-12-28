package service;

import bean.User;
import repository.UserRepository;
import repository.UserRepositoryImpl;

import javax.jws.soap.SOAPBinding;
import java.sql.SQLException;
import java.util.List;

public class UserService implements UserServiceImpl{
    UserRepositoryImpl userRepository=new UserRepository();

    @Override
    public void insertUser(User user) throws SQLException {
        this.userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return this.userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return this.userRepository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return this.userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return this.userRepository.updateUser(user);
    }
    @Override
    public List<User> selectUserByCountry(String country){
        return this.userRepository.selectUserByCountry(country);
    }

    @Override
    public List<User> sortByName() {
        return this.userRepository.sortByName();
    }
}
