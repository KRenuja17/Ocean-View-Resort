<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.hotel.model.User" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
%>
<html>
<head>
    <title>Ocean View - Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="container">
    <h1>Ocean View Reservation System</h1>
    <div class="top-bar">
        <span>Welcome, <strong><%= currentUser != null ? currentUser.getUsername() : "" %></strong></span>
        <a class="button secondary" href="${pageContext.request.contextPath}/logout">Exit System</a>
    </div>

    <h2>Main Menu</h2>
    <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/reservations">1. Add New Reservation</a></li>
        <li><a href="${pageContext.request.contextPath}/reservation/view">2. Display Reservation Details</a></li>
        <li><a href="${pageContext.request.contextPath}/reservation/view">3. Calculate and Print Bill</a></li>
        <li><a href="${pageContext.request.contextPath}/reports">4. Reports</a></li>
        <li><a href="${pageContext.request.contextPath}/help.jsp">5. Help</a></li>
        <li><a href="${pageContext.request.contextPath}/logout">6. Exit System</a></li>
    </ul>
</div>
</body>
</html>

