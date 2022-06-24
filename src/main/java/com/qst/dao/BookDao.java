package com.qst.dao;

import com.qst.domain.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookDao {
    // 增加书籍
    int addBook(Books book);

    // 查询全部书籍
    List<Books> queryAllBook();

    List<Books> queryUserBook(String userName);

    // 通过 id 查询某本书
    Books queryBookById(@Param("bookID") int id);

    // 通过书名查询某本书
    List<Books> queryBookByName(@Param("bookName") String name);

    // 更新
    int updateBook(Books book);

    // 删除
    int deleteBookById(@Param("bookID") int id);

    String queryBorrowBookStatus(@Param("userName") String userName, @Param("bookID") int id);
}
