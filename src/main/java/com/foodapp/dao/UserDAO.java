package com.foodapp.dao;

import java.sql.Timestamp;
import java.util.List;
import com.foodapp.model.User;

public interface UserDAO {

    boolean insertUser(User user);
    boolean updateUser(User user);
    boolean deleteUser(int userId);
    User getUserById(int userId);
    List<User> getAllUsers();
    User getUserByEmail(String email);
    void updateLastLogin(int userId, Timestamp lastLogin);
}