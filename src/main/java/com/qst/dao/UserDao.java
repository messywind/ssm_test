package com.qst.dao;

import com.qst.domain.Users;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    Users queryUser(Users user);

    Users queryUserByName(@Param("userName") String userName);

    int addUser(Users user);
}
