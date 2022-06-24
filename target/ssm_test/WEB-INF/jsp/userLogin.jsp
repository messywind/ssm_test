<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍共享管理系统登录</title>
    <link href= "http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/userLogin.css" rel="stylesheet" type="text/css">
</head>
<body>
<div >
    <div class="container-fluid" >
        <div class="row-fluid">
            <legend class="a1">书籍共享管理系统登录</legend>
            <div class="span12">
                
                <form class="form-inline" action="${pageContext.request.contextPath}/user/checkUser.do" method="post">

                    <fieldset>

                        <label class="a2">用户名&nbsp;<input type="text" name="userName"  placeholder="用户" required/></label>
                        <br/>
                        <br/>

                        <label class="a2">密&nbsp;码&nbsp;&nbsp;&nbsp;<input type="password" name="userPassword"placeholder="密码" required/></label>
                        <br/>
                        <br/>
                        <button class="btn" type="submit">登录</button>
                        <br/>

                        <p style="color:#ff0000;font-weight: bold">${error}</p>
                    </fieldset>

                </form>
                <form class="form-inline" action="${pageContext.request.contextPath}/user/toRegister.do" method="post">
                    <button class="btn" type="submit">注册</button>
                </form>
<%--                <a href="${pageContext.request.contextPath}/user/toRegister.do">注册</a>--%>
            </div>
        </div>
    </div>
</div>
</body>
</html>