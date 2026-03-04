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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css?v=3">
</head>
<body class="ovr-app">
<nav class="navbar navbar-expand-lg navbar-light bg-white mb-5 shadow-sm sticky-top">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/dashboard">
            <i class="bi bi-water text-primary"></i>
            <span>Ocean View</span>
        </a>
        <div class="d-flex align-items-center gap-3">
            <div class="d-none d-md-block text-end">
                <div class="small text-muted">Signed in as</div>
                <div class="fw-bold"><%= currentUser != null ? currentUser.getUsername() : "Guest" %></div>
            </div>
            <a class="btn btn-outline-danger btn-sm" href="${pageContext.request.contextPath}/logout">
                <i class="bi bi-box-arrow-right"></i> Sign Out
            </a>
        </div>
    </div>
</nav>

<div class="container mb-5">
    <div class="row mb-4">
        <div class="col-12">
            <h1 class="h2 fw-bold text-white text-shadow">Welcome back!</h1>
            <p class="text-white-50 text-shadow">Manage reservations, guests, and billing efficiently.</p>
        </div>
    </div>

    <div class="row g-4">
        <!-- New Reservation -->
        <div class="col-md-6 col-lg-4">
            <a href="${pageContext.request.contextPath}/reservations" class="text-decoration-none">
                <div class="card h-100 border-0 shadow-sm hover-lift">
                    <div class="card-body p-4 text-center">
                        <div class="display-4 text-primary mb-3">
                            <i class="bi bi-calendar-plus"></i>
                        </div>
                        <h3 class="h5 fw-bold text-dark">New Reservation</h3>
                        <p class="text-muted small">Create a new booking for a guest.</p>
                    </div>
                </div>
            </a>
        </div>

        <!-- View Reservations -->
        <div class="col-md-6 col-lg-4">
            <a href="${pageContext.request.contextPath}/reservation/view" class="text-decoration-none">
                <div class="card h-100 border-0 shadow-sm hover-lift">
                    <div class="card-body p-4 text-center">
                        <div class="display-4 text-info mb-3">
                            <i class="bi bi-search"></i>
                        </div>
                        <h3 class="h5 fw-bold text-dark">Find Reservation</h3>
                        <p class="text-muted small">Search and view existing booking details.</p>
                    </div>
                </div>
            </a>
        </div>

        <!-- Billing -->
        <div class="col-md-6 col-lg-4">
            <a href="${pageContext.request.contextPath}/reservation/view" class="text-decoration-none">
                <div class="card h-100 border-0 shadow-sm hover-lift">
                    <div class="card-body p-4 text-center">
                        <div class="display-4 text-success mb-3">
                            <i class="bi bi-receipt"></i>
                        </div>
                        <h3 class="h5 fw-bold text-dark">Billing & Checkout</h3>
                        <p class="text-muted small">Calculate totals and print guest bills.</p>
                    </div>
                </div>
            </a>
        </div>

        <!-- Reports -->
        <div class="col-md-6 col-lg-4">
            <a href="${pageContext.request.contextPath}/reports" class="text-decoration-none">
                <div class="card h-100 border-0 shadow-sm hover-lift">
                    <div class="card-body p-4 text-center">
                        <div class="display-4 text-warning mb-3">
                            <i class="bi bi-bar-chart-line"></i>
                        </div>
                        <h3 class="h5 fw-bold text-dark">Reports</h3>
                        <p class="text-muted small">View occupancy and revenue reports.</p>
                    </div>
                </div>
            </a>
        </div>

        <!-- Help -->
        <div class="col-md-6 col-lg-4">
            <a href="${pageContext.request.contextPath}/help.jsp" class="text-decoration-none">
                <div class="card h-100 border-0 shadow-sm hover-lift">
                    <div class="card-body p-4 text-center">
                        <div class="display-4 text-secondary mb-3">
                            <i class="bi bi-question-circle"></i>
                        </div>
                        <h3 class="h5 fw-bold text-dark">Help Center</h3>
                        <p class="text-muted small">Get assistance with the system.</p>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>

<style>
    .text-shadow {
        text-shadow: 0 2px 4px rgba(0,0,0,0.3);
    }
    .hover-lift {
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }
    .hover-lift:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0,0,0,0.1) !important;
    }
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
