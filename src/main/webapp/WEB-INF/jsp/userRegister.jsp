<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍共享管理系统注册</title>
    <link href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/userRegister.css" rel="stylesheet" type="text/css">
</head>
<body>
<div >
    <div class="container-fluid">
        <div class="row-fluid">
            <legend class="a1">书籍共享管理系统注册</legend>
            <div class="span12">
                <form class="form-inline" action="${pageContext.request.contextPath}/user/Register.do" method="post">
                    <fieldset>

                        <label class="a2">用户名&nbsp;<input type="text" name="userName" required/></label>
                        <br/>
                        <br>
                        <label class="a2">密&nbsp;码&nbsp;&nbsp;&nbsp;<input type="password" name="userPassword" required/></label>
                        <br/>
                        <br>
                        <button class="btn" type="submit">注册</button>
                        <br/>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>