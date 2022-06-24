<%@ page import="java.io.*,java.util.*" %>
<html>
<head>
    <title>网页重定向</title>
</head>
<body>
<center>
    <h1>正在重定向</h1>
</center>
<%
    // 重定向到新地址
    String site = new String("http://localhost:8080/ssm_test_war_exploded/user/checkUser.do");
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);
%>
</body>
</html>