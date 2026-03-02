<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reports - Ocean View</title>
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
        <div class="col-lg-9">
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <h1 class="h4 mb-3">Reservation Reports</h1>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger error">${error}</div>
                    </c:if>

                    <h2 class="h5 mt-4">1. Arrivals by Check-in Date Range</h2>
                    <form method="post" action="${pageContext.request.contextPath}/reports" class="row g-3 align-items-end">
                        <input type="hidden" name="reportType" value="byDateRange"/>
                        <div class="col-md-4">
                            <label class="form-label">From</label>
                            <input type="date" class="form-control" name="fromDate" required/>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">To</label>
                            <input type="date" class="form-control" name="toDate" required/>
                        </div>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-primary w-100">Generate</button>
                        </div>
                    </form>

                    <h2 class="h5 mt-4">2. Guests Currently In-house</h2>
                    <form method="post" action="${pageContext.request.contextPath}/reports" class="mt-2">
                        <input type="hidden" name="reportType" value="currentStays"/>
                        <button type="submit" class="btn btn-outline-primary">Show Current Stays</button>
                    </form>
                </div>
            </div>

            <c:if test="${not empty reservations}">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h2 class="h5 mb-3">Report Results</h2>
                        <div class="table-responsive">
                            <table class="table table-striped table-hover align-middle">
                                <thead>
                                <tr>
                                    <th>Reservation No</th>
                                    <th>Guest</th>
                                    <th>Room Type</th>
                                    <th>Check-in</th>
                                    <th>Check-out</th>
                                    <th>Total (USD)</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${reservations}" var="r">
                                    <tr>
                                        <td>${r.reservationNumber}</td>
                                        <td>${r.guestName}</td>
                                        <td>${r.roomType}</td>
                                        <td>${r.checkIn}</td>
                                        <td>${r.checkOut}</td>
                                        <td>${r.totalAmount}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
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

