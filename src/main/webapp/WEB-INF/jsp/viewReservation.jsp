<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Reservation - Ocean View</title>
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
        <div class="col-lg-8">
            <div class="card shadow-sm border-0 mb-4">
                <div class="card-body p-4">
                    <h1 class="h4 mb-4 fw-bold text-primary">Find Reservation</h1>

                    <form method="post" action="${pageContext.request.contextPath}/reservation/view" class="row g-3 align-items-end">
                        <div class="col-md-9">
                            <label class="form-label text-uppercase small text-muted">Reservation Number</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light border-end-0"><i class="bi bi-search"></i></span>
                                <input type="text" class="form-control border-start-0 ps-0" name="reservationNumber" required
                                       placeholder="Enter reservation ID (e.g. RES-1001)"
                                       value="${param.reservationNumber}"/>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <button type="submit" class="btn btn-primary w-100">
                                Search
                            </button>
                        </div>
                    </form>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger mt-4 d-flex align-items-center gap-2">
                            <i class="bi bi-exclamation-circle-fill"></i>
                            <div>${error}</div>
                        </div>
                    </c:if>
                </div>
            </div>

            <c:if test="${not empty reservation}">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-white border-bottom pt-4 pb-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <h2 class="h5 mb-0 fw-bold">Reservation Details</h2>
                            <span class="badge bg-success bg-opacity-10 text-success px-3 py-2 rounded-pill">Confirmed</span>
                        </div>
                    </div>
                    <div class="card-body p-4">
                        <div class="row g-4 mb-4">
                            <div class="col-sm-6">
                                <div class="text-muted small text-uppercase mb-1">Guest Name</div>
                                <div class="fw-bold fs-5">${reservation.guestName}</div>
                            </div>
                            <div class="col-sm-6 text-sm-end">
                                <div class="text-muted small text-uppercase mb-1">Reservation #</div>
                                <div class="font-monospace fs-5">${reservation.reservationNumber}</div>
                            </div>

                            <div class="col-12"><hr class="my-0 text-muted opacity-25"></div>

                            <div class="col-sm-6">
                                <div class="text-muted small text-uppercase mb-1">Check-in</div>
                                <div class="d-flex align-items-center gap-2">
                                    <i class="bi bi-calendar-check text-primary"></i>
                                    <span>${reservation.checkIn}</span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="text-muted small text-uppercase mb-1">Check-out</div>
                                <div class="d-flex align-items-center gap-2">
                                    <i class="bi bi-calendar-x text-primary"></i>
                                    <span>${reservation.checkOut}</span>
                                </div>
                            </div>

                            <div class="col-12"><hr class="my-0 text-muted opacity-25"></div>

                            <div class="col-sm-6">
                                <div class="text-muted small text-uppercase mb-1">Room Type</div>
                                <div class="fw-medium">${reservation.roomType}</div>
                            </div>
                            <div class="col-sm-6">
                                <div class="text-muted small text-uppercase mb-1">Contact</div>
                                <div>${reservation.contactNumber}</div>
                            </div>
                            <div class="col-12">
                                <div class="text-muted small text-uppercase mb-1">Address</div>
                                <div>${reservation.address}</div>
                            </div>

                            <div class="col-12"><hr class="my-0 text-muted opacity-25"></div>

                            <div class="col-12 d-flex justify-content-between align-items-center bg-light p-3 rounded">
                                <span class="fw-bold text-muted">Total Amount</span>
                                <span class="fw-bold fs-4 text-primary">Rs. ${reservation.totalAmount}</span>
                            </div>
                        </div>

                        <div class="d-flex justify-content-end gap-2">
                            <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/dashboard">
                                Close
                            </a>
                            <a class="btn btn-warning"
                               href="${pageContext.request.contextPath}/reservations?action=edit&reservationNumber=${reservation.reservationNumber}">
                                <i class="bi bi-pencil"></i> Edit
                            </a>
                            <form method="post" action="${pageContext.request.contextPath}/reservations" onsubmit="return confirm('Are you sure you want to delete this reservation?');" style="display:inline;">
                                <input type="hidden" name="action" value="delete"/>
                                <input type="hidden" name="reservationNumber" value="${reservation.reservationNumber}"/>
                                <button type="submit" class="btn btn-danger">
                                    <i class="bi bi-trash"></i> Delete
                                </button>
                            </form>
                            <a class="btn btn-primary"
                               href="${pageContext.request.contextPath}/reservation/bill?reservationNumber=${reservation.reservationNumber}">
                                <i class="bi bi-receipt"></i> Generate Bill
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
