<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Reports - Ocean View</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="container">
    <h1>Reservation Reports</h1>
    <a class="button secondary" href="${pageContext.request.contextPath}/dashboard">Back to Menu</a>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <h2>1. Arrivals by Check-in Date Range</h2>
    <form method="post" action="${pageContext.request.contextPath}/reports">
        <input type="hidden" name="reportType" value="byDateRange"/>
        <label>From:
            <input type="date" name="fromDate" required/>
        </label>
        <label>To:
            <input type="date" name="toDate" required/>
        </label>
        <button type="submit">Generate</button>
    </form>

    <h2>2. Guests Currently In-house</h2>
    <form method="post" action="${pageContext.request.contextPath}/reports">
        <input type="hidden" name="reportType" value="currentStays"/>
        <button type="submit">Show Current Stays</button>
    </form>

    <c:if test="${not empty reservations}">
        <h2>Report Results</h2>
        <table class="list">
            <tr>
                <th>Reservation No</th>
                <th>Guest</th>
                <th>Room Type</th>
                <th>Check-in</th>
                <th>Check-out</th>
                <th>Total (USD)</th>
            </tr>
            <c:forEach items="${reservations}" var="r">
                <tr>
                    <td>${r.reservationNumber}</td>
                    <td>${r.guestName}</td>
                    <td>${r.roomType}</td>
                    <td>${r.checkIn}</td>
                    <td>${r.checkOut}</td>
                    <td>${r.totalAmount}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>
</body>
</html>

