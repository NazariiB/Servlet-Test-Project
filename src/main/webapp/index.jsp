<%@ page import="sql.DBmanager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Login Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="jumbotron text-center">
    <h1>Railway ticket office</h1>
    <p>Welcome to the railway ticket office</p>
</div>

<div class="container">

<c:if test="${requestScope.reg==null}">
<%--@declare id="/select"--%><form action="${pageContext.request.contextPath}/enter?page=1" method="post">
    <label>
        <input type="text" name="username" placeholder="Username" required>
    </label>
    <br/>
    <label>
        <input type="password" name="password" placeholder="Password" required>
    </label>
    <br/>
    <button type="submit" class="btn btn-success btn-xs">Log in</button>
</form>
    First time there?
    <a href="index2.jsp"><button type="submit" class="btn btn-info btn-xs">Create account</button></a>

</c:if>


<c:if test="${requestScope.reg!=null}">
    <div class="alert alert-info alert-dismissible">
        <strong>Hi, ${requestScope.reg}!</strong> You have successfully registered.
    </div>
<%--    Hi, ${requestScope.reg}--%>
<%--    <br/>--%>
<%--    You are already registered--%>
<%--    <br/>--%>
<%--    <c:forEach var="train" items="${requestScope.trains}">--%>
<%--        <tr>--%>
<%--            <td>${train.first}</td>--%>
<%--            <td>${train.last}</td>--%>
<%--            <td>${train.freeSeats}</td>--%>
<%--            <br/>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
        <a href="${pageContext.request.contextPath}/exit"><button type="submit" class="btn btn-warning btn-xs" >Log out</button></a>
<%--        <a href="${pageContext.request.contextPath}/exit">exit</a>--%>
</c:if>
    <br/><br/>

<form method="get" action="${pageContext.request.contextPath}/select">


<%--    <label for="f">Choose a first station:</label>--%>
<select name="first" id="f">
    <option>Choose a first station</option>
    <option value="Харків">Харків</option>
    <option value="Львів">Львів</option>
    <option value="Одеса">Одеса</option>
    <option value="parrot">ХУЙ</option>
    <option value="Ужгород">Ужгород</option>
    <option value="Київ">Київ</option>
</select>

<select name="last" id="l">
    <option>Choose a last station</option>
    <option value="Харків">Харків</option>
    <option value="Львів">Львів</option>
    <option value="Одеса">Одеса</option>
    <option value="parrot">ХУЙ</option>
    <option value="Ужгород">Ужгород</option>
    <option value="Київ">Київ</option>
</select>
    <button type="submit" class="btn btn-info btn-xs">Search</button>
</form>

<c:if test="${requestScope.search==null}">
<%--    <c:forEach var="Train" items="<%=new DBmanager().selectTrains()%>">--%>
<%--        <tr>--%>
<%--            <td>${Train.first}</td>--%>
<%--            <td>${Train.last}</td>--%>
<%--            <td>${Train.freeSeats}</td>--%>
<%--            <td><a href="buy?f=<c:out value='${Train.first}'/>&l=<c:out value='${Train.last}'/>">buy</a>--%>
<%--            <br/>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>First</th>
            <th>Last</th>
            <th>Free seats</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="Train" items="<%=new DBmanager().selectTrains()%>">
            <tr>
                <td>${Train.first}</td>
                <td>${Train.last}</td>
                <td>${Train.freeSeats}</td>
                <td><a href="buy?f=<c:out value='${Train.first}'/>&l=<c:out value='${Train.last}'/>">buy</a>
                    <br/>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</c:if>

<c:if test="${requestScope.search!=null}">
<%--    <c:forEach var="train1" items="${requestScope.search}">--%>
<%--        <tr>--%>
<%--            <td>${train1.first}</td>--%>
<%--            <td>${train1.last}</td>--%>
<%--            <td>${train1.freeSeats}</td>--%>
<%--            <td><a href="buy?f=<c:out value='${train1.first}'/>&l=<c:out value='${train1.last}'/>">buy</a>--%>
<%--                <br/>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>First</th>
            <th>Last</th>
            <th>Free seats</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="train1" items="${requestScope.search}">
            <tr>
                <td>${train1.first}</td>
                <td>${train1.last}</td>
                <td>${train1.freeSeats}</td>
                <td><a href="buy?f=<c:out value='${train1.first}'/>&l=<c:out value='${train1.last}'/>">buy</a>
                    <br/>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
<br/>

<c:if test="${requestScope.ticket!=null}">
    <h4>Your purchases:</h4>

<%--    <c:forEach var="train1" items="${requestScope.ticket}">--%>
<%--        <tr>--%>
<%--            <td>${train1.first}</td>--%>
<%--            <td>${train1.last}</td>--%>
<%--            <td><a href="delete?f=<c:out value='${train1.first}'/>&l=<c:out value='${train1.last}'/>">delete</a>--%>
<%--                <br/>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>First</th>
            <th>Last</th>
            <th></th>
<%--            <th></th>--%>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="train1" items="${requestScope.ticket}">
            <tr>
                <td>${train1.first}</td>
                <td>${train1.last}</td>
                <td><a href="delete?f=<c:out value='${train1.first}'/>&l=<c:out value='${train1.last}'/>">delete</a>
                    <br/>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>


</div>
</body>
</html>
