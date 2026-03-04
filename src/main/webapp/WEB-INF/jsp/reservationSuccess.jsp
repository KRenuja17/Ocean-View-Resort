<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reservation Saved - Ocean View</title>
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
        <div class="col-lg-6">
            <div class="card shadow-lg border-0 text-center">
                <div class="card-body p-5">
                    <div class="mb-4">
                        <div class="d-inline-flex align-items-center justify-content-center bg-success bg-opacity-10 rounded-circle" style="width: 80px; height: 80px;">
                            <i class="bi bi-check-lg text-success display-4"></i>
                        </div>
                    </div>

                    <h1 class="h3 fw-bold text-success mb-2">Reservation Confirmed!</h1>
                    <p class="text-muted mb-4">The booking has been successfully saved to the system.</p>

                    <div class="card bg-light border-0 mb-4 text-start">
                        <div class="card-body p-4">
                            <div class="row g-3">
                                <div class="col-6">
                                    <div class="text-uppercase small text-muted mb-1">Reservation #</div>
                                    <div class="fw-bold text-dark">${reservation.reservationNumber}</div>
                                </div>
                                <div class="col-6 text-end">
                                    <div class="text-uppercase small text-muted mb-1">Total Amount</div>
                                    <div class="fw-bold text-primary">$${reservation.totalAmount}</div>
                                </div>
                                <div class="col-12"><hr class="my-1 opacity-25"></div>
                                <div class="col-12">
                                    <div class="text-uppercase small text-muted mb-1">Guest</div>
                                    <div class="fw-medium">${reservation.guestName}</div>
                                </div>
                                <div class="col-6">
                                    <div class="text-uppercase small text-muted mb-1">Check-in</div>
                                    <div>${reservation.checkIn}</div>
                                </div>
                                <div class="col-6 text-end">
                                    <div class="text-uppercase small text-muted mb-1">Check-out</div>
                                    <div>${reservation.checkOut}</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="d-grid gap-2">
                        <a class="btn btn-primary btn-lg"
                           href="${pageContext.request.contextPath}/reservation/bill?reservationNumber=${reservation.reservationNumber}">
                            <i class="bi bi-receipt me-2"></i> View & Print Bill
                        </a>
                        <a class="btn btn-outline-secondary"
                           href="${pageContext.request.contextPath}/dashboard">
                            Return to Dashboard
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
