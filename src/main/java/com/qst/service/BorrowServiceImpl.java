package com.qst.service;

import com.qst.dao.BorrowDao;
import com.qst.domain.Borrow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BorrowServiceImpl implements BorrowService {
    @Autowired
    private BorrowDao borrowDao;

    @Override
    public List<Borrow> queryAllBorrow(String userName) {
        return borrowDao.queryAllBorrow(userName);
    }

    @Override
    public Borrow queryBorrow(String userName, int id) {
        return borrowDao.queryBorrow(userName, id);
    }

    @Override
    public int addBorrow(Borrow borrow) {
        return borrowDao.addBorrow(borrow);
    }

    @Override
    public int updateBorrow(Borrow borrow) {
        return borrowDao.updateBorrow(borrow);
    }
}
