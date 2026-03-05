<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reports - Ocean View</title>
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
        <a class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath}/dashboard">
            <i class="bi bi-arrow-left"></i> Back to Dashboard
        </a>
    </div>
</nav>

<div class="container mb-5">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="h3 fw-bold text-dark mb-0">Reports & Analytics</h1>
                <div class="text-muted small">Generate insights about reservations and guests.</div>
            </div>

            <div class="row g-4 mb-5">
                <!-- Date Range Report Card -->
                <div class="col-md-6">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="card-header bg-white border-bottom-0 pt-4 pb-0">
                            <div class="d-flex align-items-center gap-2 mb-1">
                                <div class="bg-primary bg-opacity-10 p-2 rounded">
                                    <i class="bi bi-calendar-range text-primary"></i>
                                </div>
                                <h5 class="mb-0 fw-bold">Arrivals by Date</h5>
                            </div>
                            <p class="text-muted small ms-5">View reservations within a specific check-in period.</p>
                        </div>
                        <div class="card-body pt-2">
                            <form method="post" action="${pageContext.request.contextPath}/reports">
                                <input type="hidden" name="reportType" value="byDateRange"/>
                                <div class="row g-2 mb-3">
                                    <div class="col-6">
                                        <label class="form-label small text-uppercase text-muted">From</label>
                                        <input type="date" class="form-control" name="fromDate" required/>
                                    </div>
                                    <div class="col-6">
                                        <label class="form-label small text-uppercase text-muted">To</label>
                                        <input type="date" class="form-control" name="toDate" required/>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary w-100">
                                    Generate Report
                                </button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- All Reservations Report Card -->
                <div class="col-md-6">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="card-header bg-white border-bottom-0 pt-4 pb-0">
                            <div class="d-flex align-items-center gap-2 mb-1">
                                <div class="bg-success bg-opacity-10 p-2 rounded">
                                    <i class="bi bi-list-ul text-success"></i>
                                </div>
                                <h5 class="mb-0 fw-bold">All Reservations</h5>
                            </div>
                            <p class="text-muted small ms-5">View a complete list of all reservations in the system.</p>
                        </div>
                        <div class="card-body pt-2 d-flex align-items-end">
                            <form method="post" action="${pageContext.request.contextPath}/reports" class="w-100">
                                <input type="hidden" name="reportType" value="allReservations"/>
                                <button type="submit" class="btn btn-outline-success w-100">
                                    View All Reservations
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <c:if test="${not empty error}">
                <div class="alert alert-danger d-flex align-items-center gap-2 mb-4">
                    <i class="bi bi-exclamation-circle-fill"></i>
                    <div>${error}</div>
                </div>
            </c:if>

            <c:if test="${not empty reservations}">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-white border-bottom pt-4 pb-3 d-flex justify-content-between align-items-center">
                        <h5 class="mb-0 fw-bold">Report Results</h5>
                        <span class="badge bg-secondary bg-opacity-10 text-secondary rounded-pill px-3">
                            ${reservations.size()} Records Found
                        </span>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0">
                                <thead class="bg-light">
                                    <tr>
                                        <th class="ps-4 py-3 text-uppercase text-muted small">Res. No</th>
                                        <th class="py-3 text-uppercase text-muted small">Guest</th>
                                        <th class="py-3 text-uppercase text-muted small">Room</th>
                                        <th class="py-3 text-uppercase text-muted small">Check-in</th>
                                        <th class="py-3 text-uppercase text-muted small">Check-out</th>
                                        <th class="pe-4 py-3 text-end text-uppercase text-muted small">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${reservations}" var="r">
                                        <tr>
                                            <td class="ps-4 fw-bold text-primary">${r.reservationNumber}</td>
                                            <td class="fw-medium">${r.guestName}</td>
                                            <td><span class="badge bg-light text-dark border">${r.roomType}</span></td>
                                            <td>${r.checkIn}</td>
                                            <td>${r.checkOut}</td>
                                            <td class="pe-4 text-end fw-bold">LKR ${r.totalAmount}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer bg-white border-top-0 py-3 text-end">
                        <button onclick="window.print()" class="btn btn-sm btn-outline-secondary">
                            <i class="bi bi-printer me-1"></i> Print Report
                        </button>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
