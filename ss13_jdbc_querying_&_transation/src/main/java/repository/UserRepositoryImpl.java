package repository;

import bean.User;

import java.sql.SQLException;
import java.util.List;

public interface UserRepositoryImpl {
     void insertUser(User user) throws SQLException;

     User selectUser(int id);

     List<User> selectAllUsers();

     boolean deleteUser(int id) throws SQLException;

     boolean updateUser(User user) throws SQLException;

    List<User> selectUserByCountry(String country);

    List<User> sortByName();

    User getUserById(int id);

    void insertUserStore(User user) throws SQLException;

     void insertUpdateWithoutTransaction();

    void addUserTransaction(User user, int[] permision);

     void insertUpdateUseTransaction();

     List<User> selectAllUsersTransaction();

    boolean updateUserTransaction(User user) throws SQLException;

    boolean deleteUserTransaction(int id) throws SQLException;
}
