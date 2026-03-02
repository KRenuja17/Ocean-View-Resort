<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Reservation - Ocean View</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/dashboard">Ocean View Reservation System</a>
        <a class="btn btn-outline-light btn-sm" href="${pageContext.request.contextPath}/dashboard">Back to Menu</a>
    </div>
</nav>

<div class="container mb-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <h1 class="h4 mb-3">Display Reservation Details / Bill</h1>

                    <form method="post" action="${pageContext.request.contextPath}/reservation/view" class="row g-3">
                        <div class="col-md-8">
                            <label class="form-label">Reservation Number</label>
                            <input type="text" class="form-control" name="reservationNumber" required
                                   value="${param.reservationNumber}"/>
                        </div>
                        <div class="col-md-4 d-flex align-items-end">
                            <button type="submit" class="btn btn-primary w-100">Search</button>
                        </div>
                    </form>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger error mt-3">${error}</div>
                    </c:if>
                </div>
            </div>

            <c:if test="${not empty reservation}">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h2 class="h5 mb-3">Reservation Details</h2>
                        <div class="table-responsive">
                            <table class="table table-bordered align-middle mb-4">
                                <tr><th scope="row">Reservation No</th><td>${reservation.reservationNumber}</td></tr>
                                <tr><th scope="row">Guest Name</th><td>${reservation.guestName}</td></tr>
                                <tr><th scope="row">Address</th><td>${reservation.address}</td></tr>
                                <tr><th scope="row">Contact Number</th><td>${reservation.contactNumber}</td></tr>
                                <tr><th scope="row">Room Type</th><td>${reservation.roomType}</td></tr>
                                <tr><th scope="row">Check-in</th><td>${reservation.checkIn}</td></tr>
                                <tr><th scope="row">Check-out</th><td>${reservation.checkOut}</td></tr>
                                <tr><th scope="row">Total Amount (USD)</th><td>${reservation.totalAmount}</td></tr>
                            </table>
                        </div>

                        <div class="text-end">
                            <a class="btn btn-primary"
                               href="${pageContext.request.contextPath}/reservation/bill?reservationNumber=${reservation.reservationNumber}">
                                Calculate / Print Bill
                            </a>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

