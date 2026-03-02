<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Guest Bill - Ocean View</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css?v=2">
</head>
<body class="ovr-app">
<nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/dashboard">Ocean View Reservation System</a>
        <a class="btn btn-outline-light btn-sm" href="${pageContext.request.contextPath}/dashboard">Back to Menu</a>
    </div>
</nav>

<div class="container mb-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h1 class="h4 mb-3">Guest Bill</h1>

                    <c:if test="${not empty reservation}">
                        <div class="table-responsive">
                            <table class="table table-bordered align-middle mb-3">
                                <tr><th scope="row">Reservation No</th><td>${reservation.reservationNumber}</td></tr>
                                <tr><th scope="row">Guest Name</th><td>${reservation.guestName}</td></tr>
                                <tr><th scope="row">Room Type</th><td>${reservation.roomType}</td></tr>
                                <tr><th scope="row">Check-in</th><td>${reservation.checkIn}</td></tr>
                                <tr><th scope="row">Check-out</th><td>${reservation.checkOut}</td></tr>
                                <tr><th scope="row">Nights</th><td>${nights}</td></tr>
                                <tr><th scope="row">Total Amount (USD)</th><td>${reservation.totalAmount}</td></tr>
                            </table>
                        </div>

                        <p class="info alert alert-info">
                            Use your browser’s <strong>Print</strong> option to print this bill.
                        </p>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

