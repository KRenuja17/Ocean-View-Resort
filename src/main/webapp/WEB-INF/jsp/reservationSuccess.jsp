<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reservation Saved - Ocean View</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="container">
    <h1>Reservation Saved Successfully</h1>
    <p>The reservation has been stored in the system.</p>

    <table class="details">
        <tr><th>Reservation No</th><td>${reservation.reservationNumber}</td></tr>
        <tr><th>Guest Name</th><td>${reservation.guestName}</td></tr>
        <tr><th>Room Type</th><td>${reservation.roomType}</td></tr>
        <tr><th>Check-in</th><td>${reservation.checkIn}</td></tr>
        <tr><th>Check-out</th><td>${reservation.checkOut}</td></tr>
        <tr><th>Total Amount (USD)</th><td>${reservation.totalAmount}</td></tr>
    </table>

    <p>
        <a class="button" href="${pageContext.request.contextPath}/reservation/bill?reservationNumber=${reservation.reservationNumber}">
            View / Print Bill
        </a>
    </p>

    <p>
        <a class="button secondary" href="${pageContext.request.contextPath}/dashboard">Back to Menu</a>
    </p>
</div>
</body>
</html>

