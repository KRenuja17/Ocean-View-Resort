<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.hotel.model.User" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ocean View - Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/dashboard">Ocean View Reservation System</a>
        <div class="d-flex ms-auto">
            <span class="navbar-text me-3">
                Welcome, <strong><%= currentUser != null ? currentUser.getUsername() : "" %></strong>
            </span>
            <a class="btn btn-outline-light btn-sm" href="${pageContext.request.contextPath}/logout">Exit System</a>
        </div>
    </div>
</nav>

<div class="container mb-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h2 class="h4 mb-3">Main Menu</h2>
                    <div class="list-group">
                        <a class="list-group-item list-group-item-action"
                           href="${pageContext.request.contextPath}/reservations">
                            1. Add New Reservation
                        </a>
                        <a class="list-group-item list-group-item-action"
                           href="${pageContext.request.contextPath}/reservation/view">
                            2. Display Reservation Details
                        </a>
                        <a class="list-group-item list-group-item-action"
                           href="${pageContext.request.contextPath}/reservation/view">
                            3. Calculate and Print Bill
                        </a>
                        <a class="list-group-item list-group-item-action"
                           href="${pageContext.request.contextPath}/reports">
                            4. Reports
                        </a>
                        <a class="list-group-item list-group-item-action"
                           href="${pageContext.request.contextPath}/help.jsp">
                            5. Help
                        </a>
                        <a class="list-group-item list-group-item-action text-danger"
                           href="${pageContext.request.contextPath}/logout">
                            6. Exit System
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

