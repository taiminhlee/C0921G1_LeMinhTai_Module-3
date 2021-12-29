package service;

import bean.User;

import java.sql.SQLException;
import java.util.List;

public interface UserServiceImpl {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    List<User> selectUserByCountry(String country);

    List<User> sortByName();

    User getUserById(int id);

    void insertUserStore(User user) throws SQLException;

    public void insertUpdateWithoutTransaction();

    void addUserTransaction(User user, int[] permision);

    public void insertUpdateUseTransaction();

    List<User> selectAllUsersTransaction();

    boolean updateUserTransaction(User user) throws SQLException;

    boolean deleteUserTransaction(int id) throws SQLException;
}
