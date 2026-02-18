<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ocean View - Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="container">
    <h1>Ocean View Resort</h1>
    <h2>Staff Login</h2>

    <c:if test="${param.logout == '1'}">
        <div class="info">You have been logged out safely.</div>
    </c:if>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/login">
        <label>Username:
            <input type="text" name="username" required>
        </label>
        <label>Password:
            <input type="password" name="password" required>
        </label>
        <button type="submit">Login</button>
    </form>

    <div class="help-link">
        <a href="${pageContext.request.contextPath}/help.jsp">Help</a>
    </div>
</div>
</body>
</html>

