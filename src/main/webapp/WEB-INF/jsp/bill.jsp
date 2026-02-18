<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Guest Bill - Ocean View</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="container">
    <h1>Guest Bill</h1>
    <a class="button secondary" href="${pageContext.request.contextPath}/dashboard">Back to Menu</a>

    <c:if test="${not empty reservation}">
        <table class="details">
            <tr><th>Reservation No</th><td>${reservation.reservationNumber}</td></tr>
            <tr><th>Guest Name</th><td>${reservation.guestName}</td></tr>
            <tr><th>Room Type</th><td>${reservation.roomType}</td></tr>
            <tr><th>Check-in</th><td>${reservation.checkIn}</td></tr>
            <tr><th>Check-out</th><td>${reservation.checkOut}</td></tr>
            <tr><th>Nights</th><td>${nights}</td></tr>
            <tr><th>Total Amount (USD)</th><td>${reservation.totalAmount}</td></tr>
        </table>

        <p class="info">Use your browser’s Print option to print this bill.</p>
    </c:if>
</div>
</body>
</html>

