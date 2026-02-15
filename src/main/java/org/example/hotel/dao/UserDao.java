package org.example.hotel.dao;

import org.example.hotel.model.User;

import java.util.Optional;

public interface UserDao {

    Optional<User> findByUsernameAndPassword(String username, String password);
}

