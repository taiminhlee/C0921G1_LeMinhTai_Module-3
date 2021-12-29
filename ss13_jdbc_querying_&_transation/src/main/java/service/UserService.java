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

    @Override
    public User getUserById(int id) {
        return userRepository.getUserById(id);
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        userRepository.insertUser(user);
    }

    @Override
    public void insertUpdateWithoutTransaction() {
        userRepository.insertUpdateWithoutTransaction();
    }

    @Override
    public void addUserTransaction(User user, int[] permision) {
        userRepository.addUserTransaction(user,permision);
    }

    @Override
    public void insertUpdateUseTransaction() {
        userRepository.insertUpdateUseTransaction();
    }

    @Override
    public List<User> selectAllUsersTransaction() {
        return userRepository.selectAllUsersTransaction();
    }

    @Override
    public boolean updateUserTransaction(User user) throws SQLException {
        return userRepository.updateUserTransaction(user);
    }

    @Override
    public boolean deleteUserTransaction(int id) throws SQLException {
        return userRepository.deleteUserTransaction(id);
    }
}
