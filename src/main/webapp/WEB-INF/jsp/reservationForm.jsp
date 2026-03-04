<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>New Reservation - Ocean View</title>
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
                    <h1 class="h4 mb-3">New Reservation</h1>

                    <form method="post" action="${pageContext.request.contextPath}/reservations" class="mt-3">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Reservation Number</label>
                                <input type="text" class="form-control" name="reservationNumber" required
                                       value="${reservation.reservationNumber}"/>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Guest Name</label>
                                <input type="text" class="form-control" name="guestName" required
                                       value="${reservation.guestName}"/>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Address</label>
                                <input type="text" class="form-control" name="address" required
                                       value="${reservation.address}"/>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Contact Number</label>
                                <input type="text" class="form-control" name="contactNumber" required
                                       value="${reservation.contactNumber}"/>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Room Type</label>
                                <select class="form-select" name="roomType" required>
                                    <option value="">-- Select --</option>
                                    <option value="STANDARD"
                                            <c:if test="${reservation.roomType == 'STANDARD'}">selected</c:if>>
                                        Standard Room
                                    </option>
                                    <option value="DELUXE"
                                            <c:if test="${reservation.roomType == 'DELUXE'}">selected</c:if>>
                                        Deluxe Room
                                    </option>
                                    <option value="SUITE"
                                            <c:if test="${reservation.roomType == 'SUITE'}">selected</c:if>>
                                        Suite
                                    </option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Check-in Date</label>
                                <input type="date" class="form-control" name="checkIn" required
                                       value="${reservation.checkIn}"/>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Check-out Date</label>
                                <input type="date" class="form-control" name="checkOut" required
                                       value="${reservation.checkOut}"/>
                            </div>
                        </div>

                        <div class="mt-4 d-flex justify-content-between">
                            <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-outline-secondary">
                                Cancel
                            </a>
                            <button type="submit" class="btn btn-primary">
                                Save Reservation
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
    <div class="modal" id="reservationErrorModal" tabindex="-1"
         aria-labelledby="reservationErrorModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-0 pb-0">
                    <h5 class="modal-title" id="reservationErrorModalLabel">
                        Please fix the following before continuing
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <ul class="mb-0">
                        <c:forEach items="${errors}" var="err">
                            <li>${err}</li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="modal-footer border-0 pt-0">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                        Got it
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
