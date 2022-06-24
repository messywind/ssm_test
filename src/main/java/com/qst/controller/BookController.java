package com.qst.controller;

import com.qst.domain.Books;
import com.qst.domain.Borrow;
import com.qst.domain.Result;
import com.qst.domain.Users;
import com.qst.service.BookService;
import com.qst.service.BorrowService;
import com.qst.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@RequestMapping("/book")
@Controller
public class BookController {
    @Autowired
    private BookService bookService;

    @Autowired
    private UserService userService;

    @Autowired
    private BorrowService borrowService;

    @RequestMapping("/allBook.do")
    public String list(@RequestParam("userName") String userName, Model model) {
        List<Books> list = bookService.queryAllBook();
        model.addAttribute("list", list);
        model.addAttribute("userName", userName);
        return "allBook";
    }

    @RequestMapping("queryUserBook.do")
    public String queryUserBook(@RequestParam("userName") String userName, Model model) {
        List<Books> list = bookService.queryUserBook(userName);
        model.addAttribute("list", list);
        model.addAttribute("userName", userName);
        return "allBook";
    }

    @RequestMapping("queryBorrowBook.do")
    public String queryBorrowBook(@RequestParam("userName") String userName, Model model) {
        List<Borrow> list = borrowService.queryAllBorrow(userName);
        List<Result> reslist = new ArrayList<Result>();
        for (Borrow x : list) {
            Books now = bookService.queryBookById(x.getBookID());
            Result nowans = new Result(x.getBookID(), now.getBookName(), now.getBookDetail(), x.getBookStatus());
            reslist.add(nowans);
        }
        model.addAttribute("borrowlist", reslist);
        model.addAttribute("userName", userName);
        return "borrowBook";
    }

    @RequestMapping("/toAddBook.do")
    public String toAddPaper(String userName, Model model) {
        model.addAttribute("userName", userName);
        return "addBook";
    }

    @RequestMapping("/addBook.do")
    public String addBook(String userName, Books books, Model model) {
        bookService.addBook(books);
        model.addAttribute("userName", userName);
        return "redirect:allBook.do";
    }

    @RequestMapping("toUpdate.do")
    public String toUpdateBook(String userName, int id, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Books book = bookService.queryBookById(id);
        Users nowuser = userService.queryUserByName(userName);
        if (!Objects.equals(book.getUserName(), userName) && nowuser.getIsAdmin() == 0) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('你没有权限修改这本书！');");
            out.println("history.back();");
            out.println("</script>");
            out.close();
        } else {
            model.addAttribute("QBook", book);
            model.addAttribute("userName", userName);
        }
        return "updateBook";
    }

    @RequestMapping("updateBook.do")
    public String updateBook(String userName, Books book, Model model) {
        bookService.updateBook(book);
        model.addAttribute("userName", userName);
        return "redirect:allBook.do";
    }

    @RequestMapping("deleteBook.do")
    public String deleteBook(String userName, int id, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Books book = bookService.queryBookById(id);
        Users nowuser = userService.queryUserByName(userName);
        if (!Objects.equals(book.getUserName(), userName) && nowuser.getIsAdmin() == 0) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('你没有权限删除这本书！');");
            out.println("history.back();");
            out.println("</script>");
            out.close();
        } else {
            bookService.deleteBookById(id);
            model.addAttribute("userName", userName);
        }
        return "redirect:allBook.do";
    }

    @RequestMapping("queryBook.do")
    public String queryBook(String queryBookName, String userName, Model model) {
        List<Books> list = bookService.queryBookByName(queryBookName);
        if (list.isEmpty()) {
            list = bookService.queryAllBook();
        }
        model.addAttribute("list", list);
        model.addAttribute("userName", userName);
        return "allBook";
    }

    @RequestMapping("queryBookByName.do")
    public String queryBookByName(String queryBookName, String userName, Model model) {
        List<Books> list = bookService.queryBookByName(queryBookName);
        if (list.isEmpty()) {
            list = bookService.queryAllBook();
            model.addAttribute("error", "未查到");
        }
        model.addAttribute("list", list);
        model.addAttribute("userName", userName);
        return "allBook";
    }

    @RequestMapping("/borrowBook.do")
    public String borrowBook(String userName, int id, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        model.addAttribute("userName", userName);
        Borrow check = borrowService.queryBorrow(userName, id);
        if (check == null) {
            borrow(id, response);
            Borrow in = new Borrow(userName, id, "借出");
            borrowService.addBorrow(in);
        } else if (Objects.equals(check.getBookStatus(), "借出")) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('你还没有归还这本书！');");
            out.println("history.back();");
            out.println("</script>");
            out.close();
        } else if (Objects.equals(check.getBookStatus(), "归还")) {
            borrow(id, response);
            Borrow in = new Borrow(userName, id, "借出");
            borrowService.updateBorrow(in);
        }
        List<Books> list = bookService.queryAllBook();
        model.addAttribute("list", list);
        return "allBook";
    }

    private void borrow(int id, HttpServletResponse response) throws IOException {
        Books res = bookService.queryBookById(id);
        if (res.getBookCount() == 0) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('书已经被借没了！');");
            out.println("history.back();");
            out.println("</script>");
            out.close();
        } else {
            res.setBookCount(res.getBookCount() - 1);
            bookService.updateBook(res);
        }
    }

    @RequestMapping("/returnBook.do")
    public String returnBook(String userName, int id, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        model.addAttribute("userName", userName);
        Borrow check = borrowService.queryBorrow(userName, id);
        if (check == null) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('你还没有借过这本书！');");
            out.println("history.back();");
            out.println("</script>");
            out.close();
        } else if (Objects.equals(check.getBookStatus(), "借出")) {
            Books res = bookService.queryBookById(id);
            res.setBookCount(res.getBookCount() + 1);
            bookService.updateBook(res);
            Borrow in = new Borrow(userName, id, "归还");
            borrowService.updateBorrow(in);
        } else if (Objects.equals(check.getBookStatus(), "归还")) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('你已经归还了这本书！');");
            out.println("history.back();");
            out.println("</script>");
            out.close();
        }
        List<Books> list = bookService.queryAllBook();
        model.addAttribute("list", list);
        return "allBook";
    }
}
