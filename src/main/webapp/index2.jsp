<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<form action="${pageContext.request.contextPath}/new?page=1" method="post">
    <label>
        <input name="firstName" type="text" required>
    </label>
    <br/>
    <label>
        <input name="lastName" type="text">
    </label>
    <br/>
    <label>
        <input name="username" type="text">
    </label>
    <br/>
    <label>
        <input name="password" type="text">
    </label>
    <br/>
    <label>
    <input name="address" type="text">
    </label>
    <br/>
    <label>
        <input name="contact" type="text">
    </label>
    <br/>
    <input type="submit" VALUE="Submit">

    <div class="container">
    <div class="form-row">
        <div class="col-md-4 mb-3">
            <label for="validationDefault01">First name</label>
            <input type="text" name="fn" class="form-control" id="validationDefault01" placeholder="First name" required>
        </div>
        <div class="col-md-4 mb-3">
            <label for="validationDefault02">Last name</label>
            <input type="text" class="form-control" id="validationDefault02" placeholder="Last name" required>
        </div>
        <div class="col-md-4 mb-3">
            <label for="validationDefaultUsername">Username</label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroupPrepend2"></span>
                </div>
                <input type="text" class="form-control" id="validationDefaultUsername" placeholder="Username" aria-describedby="inputGroupPrepend2" required>
            </div>
        </div>
    </div>
    <div class="form-row">
        <div class="col-md-6 mb-3">
            <label for="validationDefault03">City</label>
            <input type="text" class="form-control" id="validationDefault03" placeholder="City" required>
        </div>
        <div class="col-md-6 mb-3">
            <label for="validationDefault04">Contacts</label>
            <input type="text" class="form-control" id="validationDefault04" placeholder="State" required>
        </div>
        <div class="col-md-3 mb-3">
            <label for="validationDefault05">Password</label>
            <input type="password" name="pas" class="form-control" id="validationDefault05" placeholder="Password" required>
        </div>
    </div>
<%--    <div class="form-group">--%>
<%--        <div class="form-check">--%>
<%--            <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>--%>
<%--            <label class="form-check-label" for="invalidCheck2">--%>
<%--                Agree to terms and conditions--%>
<%--            </label>--%>
<%--        </div>--%>
<%--    </div>--%></div>
    <br>
    <div class="container">
    <button class="btn btn-primary" type="submit">Submit form</button>
    </div>
</form>

</body>
</html>