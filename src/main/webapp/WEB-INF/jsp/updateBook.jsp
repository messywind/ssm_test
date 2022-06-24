<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍展示</title>
    <link href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/updateBook.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
    <div class="a2">
        <div >
            <div >
                <h1 >
                    <small class="a1">书籍列表--修改书籍页面</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="a3">
    <form action="${pageContext.request.contextPath}/book/updateBook.do" method="post">
        <input type="hidden" name="bookID" value="${QBook.bookID}">
        <input hidden="hidden" name="userName" value="${userName}">
        <div class="form-group">
            <label>书籍名称：</label>
            <input type="text" name="bookName" value="${QBook.bookName}" class="form-control" required>
        </div>
        <div class="form-group">
            <label>书籍数量：</label>
            <input type="text" name="bookCount" value="${QBook.bookCount}" class="form-control" required>
        </div>
        <div class="form-group">
            <label>书籍描述：</label>
            <input type="text" name="bookDetail" value="${QBook.bookDetail}" class="form-control" required>
        </div>
        <div class="form-group">
            <input type="submit" class="form-control" value="修改书籍" >
        </div>
    </form>
    </div>
</div>
</body>
</html>
