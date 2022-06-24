package com.qst.controller;

import com.qst.domain.Books;
import com.qst.domain.Users;
import com.qst.service.BookService;
import com.qst.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@RequestMapping("/user")
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private BookService bookService;

    @RequestMapping("/checkUser.do")
    public String checkUser(Users user, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (user.getUserName() == null && user.getUserPassword() == null) {
            return "userLogin";
        }
        Users ans = userService.queryUser(user);
        if (ans == null) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('用户名或密码错误！');");
            out.println("history.back();");
            out.println("</script>");
            out.close();
            return "userLogin";
        }
        List<Books> res = bookService.queryAllBook();
        model.addAttribute("list", res);
        model.addAttribute("userName", ans.getUserName());
        return "allBook";
    }

    @RequestMapping("/toRegister.do")
    public String toRegister() {
        return "userRegister";
    }

    @RequestMapping("/Register.do")
    public String Register(String userName, String userPassword) {
        Users users = new Users(userName, userPassword, 0);
        userService.addUser(users);
        return "userLogin";
    }
}
