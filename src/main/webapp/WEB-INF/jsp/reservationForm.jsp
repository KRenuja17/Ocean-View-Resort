<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>New Reservation - Ocean View</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="container">
    <h1>New Reservation</h1>
    <a class="button secondary" href="${pageContext.request.contextPath}/dashboard">Back to Menu</a>

    <c:if test="${not empty errors}">
        <div class="error">
            <ul>
                <c:forEach items="${errors}" var="err">
                    <li>${err}</li>
                </c:forEach>
            </ul>
        </div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/reservations">
        <label>Reservation Number:
            <input type="text" name="reservationNumber" required
                   value="${reservation.reservationNumber}"/>
        </label>
        <label>Guest Name:
            <input type="text" name="guestName" required
                   value="${reservation.guestName}"/>
        </label>
        <label>Address:
            <input type="text" name="address" required
                   value="${reservation.address}"/>
        </label>
        <label>Contact Number:
            <input type="text" name="contactNumber" required
                   value="${reservation.contactNumber}"/>
        </label>
        <label>Room Type:
            <select name="roomType" required>
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
        </label>
        <label>Check-in Date:
            <input type="date" name="checkIn" required
                   value="${reservation.checkIn}"/>
        </label>
        <label>Check-out Date:
            <input type="date" name="checkOut" required
                   value="${reservation.checkOut}"/>
        </label>

        <button type="submit">Save Reservation</button>
    </form>
</div>
</body>
</html>

