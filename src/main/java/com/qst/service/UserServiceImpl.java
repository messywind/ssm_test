package com.qst.service;

import com.qst.dao.UserDao;
import com.qst.domain.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDao userDao;

    @Override
    public Users queryUser(Users user) {
        return userDao.queryUser(user);
    }

    @Override
    public Users queryUserByName(String userName) {
        return userDao.queryUserByName(userName);
    }

    @Override
    public int addUser(Users user) {
        return userDao.addUser(user);
    }
}
