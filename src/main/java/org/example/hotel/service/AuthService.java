package org.example.hotel.service;

import org.example.hotel.dao.UserDao;
import org.example.hotel.model.User;

import java.util.Optional;

public class AuthService {

    private final UserDao userDao;

    public AuthService(UserDao userDao) {
        this.userDao = userDao;
    }

    public Optional<User> login(String username, String password) {
        if (username == null || username.trim().isEmpty()
                || password == null || password.trim().isEmpty()) {
            return Optional.empty();
        }
        return userDao.findByUsernameAndPassword(username.trim(), password);
    }
}

