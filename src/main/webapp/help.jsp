<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.hotel.model.User" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Help Center - Ocean View</title>
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
            <div class="text-center mb-5">
                <h1 class="h2 fw-bold text-dark">Help Center</h1>
                <p class="text-muted">Find answers to common questions about the Ocean View Resort system.</p>
            </div>

            <div class="accordion" id="helpAccordion">
                <!-- Item 1: Managing Reservations -->
                <div class="accordion-item card shadow-sm border-0 mb-3">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                            <i class="bi bi-calendar-heart me-2 text-primary"></i>
                            <strong>Managing Reservations</strong>
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#helpAccordion">
                        <div class="accordion-body">
                            <p><strong>How do I create a new reservation?</strong></p>
                            <p>From the main dashboard, click on the "New Reservation" card. You will be taken to a form where a unique reservation number is automatically generated. Fill in the guest and booking details, then click "Save Reservation".</p>

                            <p><strong>How do I find, edit, or delete an existing reservation?</strong></p>
                            <p>Click the "Find Reservation" card on the dashboard. Enter the reservation number you wish to find and click "Search". The reservation details will be displayed, along with buttons to "Edit", "Delete", or "Generate Bill".</p>
                        </div>
                    </div>
                </div>

                <!-- Item 2: Billing -->
                <div class="accordion-item card shadow-sm border-0 mb-3">
                    <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            <i class="bi bi-receipt me-2 text-success"></i>
                            <strong>Billing & Invoices</strong>
                        </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#helpAccordion">
                        <div class="accordion-body">
                            <p><strong>How do I print a bill for a guest?</strong></p>
                            <p>First, find the reservation using the "Find Reservation" feature. Once the details are displayed, click the "Generate Bill" button. This will take you to a printable invoice page. Use the "Print Invoice" button on that page to open your browser's print dialog.</p>
                        </div>
                    </div>
                </div>

                <!-- Item 3: Reports -->
                <div class="accordion-item card shadow-sm border-0 mb-3">
                    <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            <i class="bi bi-bar-chart-line me-2 text-warning"></i>
                            <strong>Reports (Admin Access)</strong>
                        </button>
                    </h2>
                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#helpAccordion">
                        <div class="accordion-body">
                            <p><strong>How do I generate reports?</strong></p>
                            <p>If you are logged in as an Administrator, you will see a "Reports" card on the dashboard. Click it to access the reporting section. You can generate reports for arrivals within a specific date range or view a list of all reservations ever made.</p>
                            <p><strong>Why can't I see the Reports section?</strong></p>
                            <p>Access to the reports section is restricted to users with the 'ADMIN' role. If you believe you should have access, please contact the system administrator.</p>
                        </div>
                    </div>
                </div>

                <!-- Item 4: User Accounts -->
                <div class="accordion-item card shadow-sm border-0 mb-3">
                    <h2 class="accordion-header" id="headingFour">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                            <i class="bi bi-person-circle me-2 text-info"></i>
                            <strong>User Accounts & Security</strong>
                        </button>
                    </h2>
                    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#helpAccordion">
                        <div class="accordion-body">
                            <p><strong>What are the default user accounts?</strong></p>
                            <p>For testing and initial setup, two default accounts are available:</p>
                            <ul>
                                <li><strong>Admin:</strong> username: <code>admin</code>, password: <code>admin123</code></li>
                                <li><strong>Manager:</strong> username: <code>manager</code>, password: <code>manager123</code></li>
                            </ul>
                            <p><strong>What happens if I'm inactive for too long?</strong></p>
                            <p>The system has a 30-minute session timeout. If you are inactive for 30 minutes, you will be automatically logged out for security purposes and will need to sign in again.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
