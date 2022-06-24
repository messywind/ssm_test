<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍共享管理系统</title>
    <link href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/borrowBook.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 columon">
            <div class="page-header">
                <h1>
                    书籍共享管理系统
                </h1>
                <h1>
                    欢迎用户
                    <span style="color:#002bff;font-weight: bold">${userName}</span>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/">退出</a>
                </h1>
            </div>
        </div>
        <div class="row">
            <%--            功能一：新增书籍--%>
            <div class="col-md-4 column">
                <form class="form-inline" action="${pageContext.request.contextPath}/book/toAddBook.do">
                    <input hidden="hidden" name="userName" value="${userName}">
                    <input type="submit" value="新增书籍" class="btn btn-primary">
                </form>
            </div>
            <%--                        功能二：查询全部书籍--%>
            <%--            <div class="col-md-4 column">--%>
            <%--                <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/allBook.do">查询全部书籍</a>--%>
            <%--            </div>--%>
            <%--                        功能四：查询书籍--%>
            <form class="form-inline"
                  action="${pageContext.request.contextPath}/book/queryBookByName.do?userName=${userName}" method="post"
                  style="float: right">
                <span style="color:#ff0000;font-weight: bold">${error}</span>
                <input type="text" name="queryBookName" class="form-control" placeholder="请输入要查询的书籍名称">
                <input type="submit" value="查询" class="btn btn-primary">
            </form>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <ul class="nav nav-tabs">
                <li>
                    <a href="${pageContext.request.contextPath}/book/queryBook.do?userName=${userName}">全部书籍</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/book/queryUserBook.do?userName=${userName}">我的书籍</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/book/queryBorrowBook.do?userName=${userName}">我的借阅</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="row clearfix">
    <div class="col-md-12 column">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>借阅书籍编号</th>
                <th>借阅书籍名称</th>
                <th>借阅书籍详情</th>
                <th>借阅状态</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="borrow" items="${borrowlist}">
                <tr>
                    <td>${borrow.bookID}</td>
                    <td>${borrow.bookName}</td>
                    <td>${borrow.bookDetail}</td>
                    <td>${borrow.bookStatus}</td>
                    <td></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>