d<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>${requestScope.res}</title>
</head>
<body>
    ${requestScope.res}
    <br/>
    <tbody>
    <c:forEach var="train" items="${trains}">
        <tr>
            <td>${train.first}</td>
            <td>${train.last}</td>
            <td>${train.freeSeats}</td>
            <br/>
        </tr>
    </c:forEach>
    </tbody>
    <form method="post">
        <a href="${pageContext.request.contextPath}/trains?page=1">1 </a>
        <a href="${pageContext.request.contextPath}/trains?page=2" >2</a>
    </form>
        <a href="${pageContext.request.contextPath}/menu" >Menu</a>
    ${requestScope.reg}
    <br/>

</body>
</html>
