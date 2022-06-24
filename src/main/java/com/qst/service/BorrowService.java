package com.qst.service;

import com.qst.domain.Borrow;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BorrowService {

    List<Borrow> queryAllBorrow(@Param("userName") String userName);

    Borrow queryBorrow(@Param("userName") String userName, @Param("bookID") int id);

    int addBorrow(Borrow borrow);

    int updateBorrow(Borrow borrow);
}
