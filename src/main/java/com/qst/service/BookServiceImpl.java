package com.qst.service;

import com.qst.dao.BookDao;
import com.qst.domain.Books;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService{
    @Autowired
    private BookDao bookDao;

    @Override
    public int addBook(Books book) {
        return bookDao.addBook(book);
    }

    @Override
    public List<Books> queryAllBook() {
        return bookDao.queryAllBook();
    }

    @Override
    public List<Books> queryUserBook(String userName) {
        return bookDao.queryUserBook(userName);
    }


    @Override
    public Books queryBookById(int id) {
        return bookDao.queryBookById(id);
    }

    @Override
    public List<Books> queryBookByName(String BookName) {
        return bookDao.queryBookByName(BookName);
    }

    @Override
    public int updateBook(Books book) {
        return bookDao.updateBook(book);
    }

    @Override
    public int deleteBookById(int id) {
        return bookDao.deleteBookById(id);
    }


}
