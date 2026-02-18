<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>View Reservation - Ocean View</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="container">
    <h1>Display Reservation Details / Bill</h1>
    <a class="button secondary" href="${pageContext.request.contextPath}/dashboard">Back to Menu</a>

    <form method="post" action="${pageContext.request.contextPath}/reservation/view">
        <label>Reservation Number:
            <input type="text" name="reservationNumber" required
                   value="${param.reservationNumber}"/>
        </label>
        <button type="submit">Search</button>
    </form>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <c:if test="${not empty reservation}">
        <h2>Reservation Details</h2>
        <table class="details">
            <tr><th>Reservation No</th><td>${reservation.reservationNumber}</td></tr>
            <tr><th>Guest Name</th><td>${reservation.guestName}</td></tr>
            <tr><th>Address</th><td>${reservation.address}</td></tr>
            <tr><th>Contact Number</th><td>${reservation.contactNumber}</td></tr>
            <tr><th>Room Type</th><td>${reservation.roomType}</td></tr>
            <tr><th>Check-in</th><td>${reservation.checkIn}</td></tr>
            <tr><th>Check-out</th><td>${reservation.checkOut}</td></tr>
            <tr><th>Total Amount (USD)</th><td>${reservation.totalAmount}</td></tr>
        </table>

        <p>
            <a class="button"
               href="${pageContext.request.contextPath}/reservation/bill?reservationNumber=${reservation.reservationNumber}">
                Calculate / Print Bill
            </a>
        </p>
    </c:if>
</div>
</body>
</html>

