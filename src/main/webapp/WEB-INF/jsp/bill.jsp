<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Guest Bill - Ocean View</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css?v=3">
    <style>
        @media print {
            body * {
                visibility: hidden;
            }
            #printableArea, #printableArea * {
                visibility: visible;
            }
            #printableArea {
                position: absolute;
                left: 0;
                top: 0;
                width: 100%;
                margin: 0;
                padding: 20px;
                box-shadow: none !important;
                border: none !important;
            }
            .no-print {
                display: none !important;
            }
        }
    </style>
</head>
<body class="ovr-app">
<nav class="navbar navbar-expand-lg navbar-light bg-white mb-5 shadow-sm sticky-top no-print">
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
            <div class="card shadow-lg border-0" id="printableArea">
                <div class="card-body p-5">
                    <!-- Invoice Header -->
                    <div class="d-flex justify-content-between align-items-start mb-5">
                        <div>
                            <div class="d-flex align-items-center gap-2 mb-2">
                                <i class="bi bi-water text-primary fs-3"></i>
                                <span class="h3 fw-bold text-dark mb-0">Ocean View Resort</span>
                            </div>
                            <p class="text-muted small mb-0">
                                123 Seaside Avenue<br>
                                Ocean City, FL 33139<br>
                                +1 (555) 123-4567
                            </p>
                        </div>
                        <div class="text-end">
                            <h2 class="h4 text-uppercase text-muted mb-3">Invoice</h2>
                            <div class="mb-1">
                                <span class="text-muted small text-uppercase me-2">Invoice #</span>
                                <span class="fw-bold text-dark">${reservation.reservationNumber}</span>
                            </div>
                            <div>
                                <span class="text-muted small text-uppercase me-2">Date</span>
                                <span class="fw-bold text-dark"><%= java.time.LocalDate.now() %></span>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4 opacity-25">

                    <!-- Bill To -->
                    <div class="row mb-5">
                        <div class="col-sm-6">
                            <h6 class="text-uppercase text-muted small fw-bold mb-3">Bill To:</h6>
                            <h5 class="fw-bold text-dark mb-1">${reservation.guestName}</h5>
                            <p class="text-muted small mb-0">
                                ${reservation.address}<br>
                                ${reservation.contactNumber}
                            </p>
                        </div>
                        <div class="col-sm-6 text-sm-end">
                            <h6 class="text-uppercase text-muted small fw-bold mb-3">Stay Details:</h6>
                            <div class="mb-1">
                                <span class="text-muted small me-2">Check-in:</span>
                                <span class="fw-bold text-dark">${reservation.checkIn}</span>
                            </div>
                            <div>
                                <span class="text-muted small me-2">Check-out:</span>
                                <span class="fw-bold text-dark">${reservation.checkOut}</span>
                            </div>
                        </div>
                    </div>

                    <!-- Line Items -->
                    <div class="table-responsive mb-4">
                        <table class="table table-borderless">
                            <thead class="bg-light">
                                <tr>
                                    <th scope="col" class="text-uppercase text-muted small py-3 ps-4">Description</th>
                                    <th scope="col" class="text-uppercase text-muted small py-3 text-end">Nights</th>
                                    <th scope="col" class="text-uppercase text-muted small py-3 text-end pe-4">Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="ps-4 py-3">
                                        <div class="fw-bold text-dark">Room Charge - ${reservation.roomType}</div>
                                        <div class="text-muted small">Accommodation for ${nights} nights</div>
                                    </td>
                                    <td class="text-end py-3">${nights}</td>
                                    <td class="text-end pe-4 py-3 fw-bold">$${reservation.totalAmount}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <hr class="my-4 opacity-25">

                    <!-- Total -->
                    <div class="row justify-content-end">
                        <div class="col-md-5">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="text-muted">Subtotal</span>
                                <span class="fw-bold">$${reservation.totalAmount}</span>
                            </div>
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <span class="text-muted">Tax (0%)</span>
                                <span class="fw-bold">$0.00</span>
                            </div>
                            <div class="d-flex justify-content-between align-items-center p-3 bg-primary bg-opacity-10 rounded">
                                <span class="h5 mb-0 text-primary fw-bold">Total Due</span>
                                <span class="h4 mb-0 text-primary fw-bold">$${reservation.totalAmount}</span>
                            </div>
                        </div>
                    </div>

                    <!-- Footer -->
                    <div class="mt-5 pt-4 text-center text-muted small border-top">
                        <p class="mb-0">Thank you for choosing Ocean View Resort!</p>
                        <p>For any inquiries, please contact support@oceanview.com</p>
                    </div>
                </div>
            </div>

            <!-- Actions -->
            <div class="d-flex justify-content-end gap-3 mt-4 no-print">
                <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-outline-secondary">
                    Close
                </a>
                <button onclick="window.print()" class="btn btn-primary">
                    <i class="bi bi-printer me-2"></i> Print Invoice
                </button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
