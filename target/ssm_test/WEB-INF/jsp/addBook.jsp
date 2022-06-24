<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍展示</title>
    <link href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 columon">
            <div class="page-header">
                <h1>
                    <small>书籍列表--新增书籍页面</small>
                </h1>
            </div>
        </div>
    </div>
<%--    表单提交--%>
    <form action="${pageContext.request.contextPath}/book/addBook.do" method="post">
        <input hidden="hidden" name="userName" value="${userName}">
        <div class="form-group">
            <label>书籍ID：</label>
            <input type="text" name="bookID" class="form-control" required>
        </div>
        <div class="form-group">
            <label>书籍名称：</label>
            <input type="text" name="bookName" class="form-control" required>
        </div>
        <div class="form-group">
            <label>书籍数量：</label>
            <input type="text" name="bookCount" class="form-control" required>
        </div>
        <div class="form-group">
            <label>书籍描述：</label>
            <input type="text" name="bookDetail" class="form-control" required>
        </div>
        <div class="form-group">
            <input type="submit" class="form-control" value="添加书籍">
        </div>

    </form>
</div>
</body>
</html>
