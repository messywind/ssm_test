<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍共享管理系统</title>
    <link href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/allBook.css" rel="stylesheet" type="text/css">
</head>
<style>
    .a4{
        width: 30%;
        height: 20%;
        float: left;
    }
    .a5{

       width: 10%;
    }
    .a6{
        display: inline-table;
    }

    /*.a8{*/
    /*    width: 30%;*/
    /*}*/
</style>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 columon">
            <div class="page-header" >
                <div style="margin-top: 4%;position: absolute">
                <h1 class="a2" style="color:#2690b9 ;padding-top: 1% ;font-size: 50px">
                    书籍共享管理系统
                </h1>
                </div>
                <div style=" margin-left: 50%;   margin-top: 4%;position: absolute" >
                <h1 >
                    欢迎用户
                    <span style="color:#2690b9;font-weight: bold">${userName}</span>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/">退出</a>
                </h1>
                </div>
            </div>

        </div>
        <div class="row" style="margin-top: 10% ;position: absolute;margin-left: 55%">
            <div class="col-md-4 column">
                <form class="form-inline" action="${pageContext.request.contextPath}/book/toAddBook.do">
                    <input hidden="hidden" name="userName" value="${userName}">
                    <input type="submit" value="新增书籍" class="btn btn-primary">
                </form>
            </div>
<%--            <form class="form-inline" action="${pageContext.request.contextPath}/book/queryBookByName.do?userName=${userName}" method="post"--%>
<%--                  style="float: right">--%>
<%--                <span style="color:#ff0000;font-weight: bold">${error}</span>--%>
<%--                <input type="text" name="queryBookName" class="form-control" placeholder="请输入要查询的书籍名称">--%>
<%--                <input type="submit" value="查询" class="btn btn-primary">--%>
<%--            </form>--%>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row-fluid" >
        <div class="span12">
            <ul class="nav nav-tabs" >
                <li>
                    <a href="${pageContext.request.contextPath}/book/queryBook.do?userName=${userName}">全部书籍</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/book/queryUserBook.do?userName=${userName}">我的书籍</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/book/queryBorrowBook.do?userName=${userName}">我的借阅</a>
                </li>
                <li>
                    <form class="form-inline" action="${pageContext.request.contextPath}/book/queryBookByName.do?userName=${userName}" method="post"
                          style="float: right">
                        <span style="color:#ff0000;font-weight: bold">${error}</span>
                        <input type="text" name="queryBookName" class="form-control" placeholder="请输入要查询的书籍名称">
                        <input type="submit" value="查询" class="btn btn-primary">
                    </form>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="row clearfix"style="position: absolute;margin-top: 15%">
    <div class="row clearfix"style="padding-left: 10%;padding-right: 10%;">
        <table class="table table-hover table-striped">
<%--&lt;%&ndash;            <thead>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <th>书籍编号</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <th>书籍名称</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <th>书籍数量</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <th>书籍详情</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <th>书籍用户</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </thead>&ndash;%&gt;--%>
            <tbody class="a7">
                <c:forEach var="book" items="${list}">
                    <tr class="a8">
                        <th  rowspan="4" class="a5">  <img src="${pageContext.request.contextPath}/img/2.png">   </th>
                        <th class="a4">书籍编号&nbsp; ${book.bookID}</th>
                        <th class="a4">书籍名称&nbsp; ${book.bookName}</th>
                    </tr>
                    <tr class="a8">

                        <td class="a4">书籍数量&nbsp; ${book.bookCount}</td>
                        <td class="a4">书籍详情&nbsp; ${book.bookDetail}</td>
                    </tr>
                    <tr class="a8">

                        <td class="a4">书籍用户&nbsp; ${book.userName}</td>
                    </tr>
                    <tr class="a8">

                        <td class="a6">
                            <form class="form-inline" action="${pageContext.request.contextPath}/book/toUpdate.do?userName=${userName}&id=${book.bookID}" method="post"
                                  style="float: right">
                                <input type="submit" value="修改" class="btn btn-primary">
                            </form>

                            <form class="form-inline" action="${pageContext.request.contextPath}/book/deleteBook.do?userName=${userName}&id=${book.bookID}" method="post"
                                  style="float: right">
                                <input type="submit" value="删除" class="btn btn-primary">
                            </form>

                            <form class="form-inline" action="${pageContext.request.contextPath}/book/borrowBook.do?userName=${userName}&id=${book.bookID}" method="post"
                                  style="float: right">
                                <input type="submit" value="借阅" class="btn btn-primary">
                            </form>

                            <form class="form-inline" action="${pageContext.request.contextPath}/book/returnBook.do?userName=${userName}&id=${book.bookID}" method="post"
                                  style="float: right">
                                <input type="submit" value="归还" class="btn btn-primary">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>