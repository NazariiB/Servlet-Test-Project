<%--
  Created by IntelliJ IDEA.
  User: nazik
  Date: 26.04.2022
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Form</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/hello-servlet" method="post">
    <label>
        <input type="text" name="username">
    </label>
    <br/>
    <label>
        <input type="text" name="password">
    </label>
    <br/>
    <input type="submit" name="Submit">
</form>
<form action="${pageContext.request.contextPath}/hello-servlet" method="get">
    <a href="${pageContext.request.contextPath}/new">Create Account</a>
</form>
</body>
</html>
