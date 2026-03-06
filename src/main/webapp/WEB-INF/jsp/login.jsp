<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ocean View - Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css?v=3">
    <style>
        /* Specific styles for login page to center content */
        body.login-page {
            justify-content: center;
            align-items: center;
        }
        .login-card {
            width: 100%;
            max-width: 400px;
            padding: 2rem;
        }
        .brand-logo {
            font-size: 2rem;
            font-weight: 800;
            color: var(--ovr-primary-dark);
            text-align: center;
            margin-bottom: 0.5rem;
            letter-spacing: -0.03em;
        }
        .brand-subtitle {
            text-align: center;
            color: var(--ovr-muted);
            margin-bottom: 2rem;
            font-weight: 500;
        }
    </style>
</head>
<body class="ovr-app login-page">

<div class="container d-flex justify-content-center">
    <div class="card login-card shadow-lg border-0">
        <div class="brand-logo">Ocean View</div>
        <div class="brand-subtitle">Resort Management System</div>

        <c:if test="${param.logout == '1'}">
            <div class="alert alert-info text-center py-2 mb-4 small">You have been logged out.</div>
        </c:if>

        <c:if test="${not empty error}">
            <div class="alert alert-danger text-center py-2 mb-4 small">${error}</div>
        </c:if>

        <form method="post" action="${pageContext.request.contextPath}/login">
            <div class="mb-3">
                <label class="form-label small text-uppercase text-muted">Username</label>
                <input type="text" class="form-control form-control-lg" name="username" placeholder="Enter your ID" required>
            </div>
            <div class="mb-4">
                <label class="form-label small text-uppercase text-muted">Password</label>
                <input type="password" class="form-control form-control-lg" name="password" placeholder="••••••••" required>
            </div>
            <button type="submit" class="btn btn-primary w-100 btn-lg mb-3">Sign In</button>
        </form>

        <div class="text-center mt-2">
            <a href="${pageContext.request.contextPath}/help.jsp" class="text-decoration-none small text-muted">Need help signing in?</a>
        </div>
    </div>
</div>

<div class="fixed-bottom text-center pb-3 text-white-50 small">
    &copy; ${year} Ocean View Resort. All rights reserved.
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
