package com.qst.service;

import com.qst.domain.Users;
import org.apache.ibatis.annotations.Param;

public interface UserService {
    Users queryUser(Users user);

    Users queryUserByName(@Param("userName") String userName);

    int addUser(Users user);
}
