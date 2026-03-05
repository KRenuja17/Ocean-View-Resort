<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>
        <c:choose>
            <c:when test="${isEdit}">Edit Reservation - Ocean View</c:when>
            <c:otherwise>New Reservation - Ocean View</c:otherwise>
        </c:choose>
    </title>
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
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white border-bottom-0 pt-4 pb-0">
                    <h1 class="h3 mb-0 fw-bold text-primary">
                        <c:choose>
                            <c:when test="${isEdit}">Edit Reservation</c:when>
                            <c:otherwise>New Reservation</c:otherwise>
                        </c:choose>
                    </h1>
                    <p class="text-muted small">
                        <c:choose>
                            <c:when test="${isEdit}">Update guest details for this booking.</c:when>
                            <c:otherwise>Enter guest details to create a booking.</c:otherwise>
                        </c:choose>
                    </p>
                </div>
                <div class="card-body p-4">
                    <form method="post" action="${pageContext.request.contextPath}/reservations">
                        <input type="hidden" name="action" value="${isEdit ? 'update' : 'create'}"/>

                        <div class="row g-4">
                            <!-- Section: Guest Information -->
                            <div class="col-12">
                                <h6 class="text-primary fw-bold text-uppercase small mb-2 border-bottom pb-2">
                                    <i class="bi bi-person-lines-fill me-2"></i>Guest Information
                                </h6>
                            </div>

                            <!-- Guest Name -->
                            <div class="col-md-6">
                                <label class="form-label text-uppercase small text-muted">Guest Name</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0"><i class="bi bi-person"></i></span>
                                    <input type="text" class="form-control border-start-0 ps-0" name="guestName" required
                                           placeholder="Full Name"
                                           value="${reservation.guestName}"/>
                                </div>
                            </div>

                            <!-- Contact Number -->
                            <div class="col-md-6">
                                <label class="form-label text-uppercase small text-muted">Contact Number</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0"><i class="bi bi-telephone"></i></span>
                                    <input type="text" class="form-control border-start-0 ps-0" name="contactNumber" required
                                           placeholder="e.g. 077 123 4567"
                                           value="${reservation.contactNumber}"/>
                                </div>
                            </div>

                            <!-- Address -->
                            <div class="col-12">
                                <label class="form-label text-uppercase small text-muted">Address</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0"><i class="bi bi-geo-alt"></i></span>
                                    <input type="text" class="form-control border-start-0 ps-0" name="address" required
                                           placeholder="e.g. 123 Galle Road, Colombo 03"
                                           value="${reservation.address}"/>
                                </div>
                            </div>

                            <!-- Section: Booking Details -->
                            <div class="col-12 mt-4">
                                <h6 class="text-primary fw-bold text-uppercase small mb-2 border-bottom pb-2">
                                    <i class="bi bi-calendar-check me-2"></i>Booking Details
                                </h6>
                            </div>

                            <!-- Reservation Number -->
                            <div class="col-md-6">
                                <label class="form-label text-uppercase small text-muted">Reservation #</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0"><i class="bi bi-hash"></i></span>
                                    <input type="text" class="form-control border-start-0 ps-0" name="reservationNumber" required
                                           placeholder="e.g. OVRN1001"
                                           value="${reservation.reservationNumber}"
                                           readonly/>
                                </div>
                            </div>

                            <!-- Room Type -->
                            <div class="col-md-6">
                                <label class="form-label text-uppercase small text-muted">Room Type</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0"><i class="bi bi-door-closed"></i></span>
                                    <select class="form-select border-start-0 ps-0" name="roomType" required>
                                        <option value="">-- Select Room --</option>
                                        <option value="STANDARD" <c:if test="${reservation.roomType == 'STANDARD'}">selected</c:if>>Standard Room (LKR 15,000/night)</option>
                                        <option value="DELUXE" <c:if test="${reservation.roomType == 'DELUXE'}">selected</c:if>>Deluxe Room (LKR 25,000/night)</option>
                                        <option value="SUITE" <c:if test="${reservation.roomType == 'SUITE'}">selected</c:if>>Suite (LKR 40,000/night)</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Check-in Date -->
                            <div class="col-md-6">
                                <label class="form-label text-uppercase small text-muted">Check-in Date</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0"><i class="bi bi-calendar-check"></i></span>
                                    <input type="date" class="form-control border-start-0 ps-0" name="checkIn" required
                                           value="${reservation.checkIn}"/>
                                </div>
                            </div>

                            <!-- Check-out Date -->
                            <div class="col-md-6">
                                <label class="form-label text-uppercase small text-muted">Check-out Date</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0"><i class="bi bi-calendar-x"></i></span>
                                    <input type="date" class="form-control border-start-0 ps-0" name="checkOut" required
                                           value="${reservation.checkOut}"/>
                                </div>
                            </div>
                        </div>

                        <div class="mt-5 d-flex justify-content-between align-items-center">
                            <a href="${pageContext.request.contextPath}/dashboard" class="text-decoration-none text-muted small">
                                <i class="bi bi-x-circle"></i> Cancel
                            </a>
                            <button type="submit" class="btn btn-primary px-5 py-2 shadow-sm">
                                <i class="bi bi-check-lg"></i>
                                <c:choose>
                                    <c:when test="${isEdit}">Update Reservation</c:when>
                                    <c:otherwise>Save Reservation</c:otherwise>
                                </c:choose>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<c:if test="${not empty errors}">
    <!-- Friendly pop-up modal for validation errors -->
    <div class="modal fade" id="reservationErrorModal" tabindex="-1"
         aria-labelledby="reservationErrorModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 shadow-lg">
                <div class="modal-header border-0 pb-0">
                    <h5 class="modal-title text-danger fw-bold" id="reservationErrorModalLabel">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>Action Required
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p class="text-muted mb-3">Please correct the following errors:</p>
                    <ul class="list-group list-group-flush rounded-3">
                        <c:forEach items="${errors}" var="err">
                            <li class="list-group-item list-group-item-danger border-0 mb-1 rounded">
                                <i class="bi bi-dot"></i> ${err}
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="modal-footer border-0 pt-0">
                    <button type="button" class="btn btn-primary px-4" data-bs-dismiss="modal">
                        Okay
                    </button>
                </div>
            </div>
        </div>
    </div>
</c:if>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<c:if test="${not empty errors}">
    <script>
        (function () {
            document.addEventListener('DOMContentLoaded', function () {
                var modalEl = document.getElementById('reservationErrorModal');
                if (modalEl && window.bootstrap && typeof bootstrap.Modal === 'function') {
                    var instance = bootstrap.Modal.getOrCreateInstance(modalEl, {
                        backdrop: 'static',
                        keyboard: true
                    });
                    instance.show();
                }
            });
        })();
    </script>
</c:if>
</body>
</html>
