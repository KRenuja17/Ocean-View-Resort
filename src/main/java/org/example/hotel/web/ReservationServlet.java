package org.example.hotel.web;

import org.example.hotel.dao.ReservationDaoImpl;
import org.example.hotel.model.Reservation;
import org.example.hotel.model.User;
import org.example.hotel.service.ReservationService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.Optional;

public class ReservationServlet extends HttpServlet {

    private ReservationService reservationService;

    @Override
    public void init() {
        this.reservationService = new ReservationService(new ReservationDaoImpl());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!ensureAuthenticated(req, resp)) {
            return;
        }

        String action = req.getParameter("action");
        if ("edit".equals(action)) {
            String reservationNumber = req.getParameter("reservationNumber");
            Optional<Reservation> reservationOpt = reservationService.findByReservationNumber(reservationNumber);
            if (reservationOpt.isPresent()) {
                req.setAttribute("reservation", reservationOpt.get());
                req.setAttribute("isEdit", true);
                req.getRequestDispatcher("/WEB-INF/jsp/reservationForm.jsp").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Reservation not found");
            }
        } else {
            req.getRequestDispatcher("/WEB-INF/jsp/reservationForm.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!ensureAuthenticated(req, resp)) {
            return;
        }

        String action = req.getParameter("action");
        if ("delete".equals(action)) {
            String reservationNumber = req.getParameter("reservationNumber");
            reservationService.deleteReservation(reservationNumber);
            resp.sendRedirect(req.getContextPath() + "/dashboard");
            return;
        }

        Reservation reservation = new Reservation();
        reservation.setReservationNumber(req.getParameter("reservationNumber"));
        reservation.setGuestName(req.getParameter("guestName"));
        reservation.setAddress(req.getParameter("address"));
        reservation.setContactNumber(req.getParameter("contactNumber"));
        reservation.setRoomType(req.getParameter("roomType"));

        try {
            String checkInStr = req.getParameter("checkIn");
            String checkOutStr = req.getParameter("checkOut");
            if (checkInStr != null && !checkInStr.isEmpty()) {
                reservation.setCheckIn(LocalDate.parse(checkInStr));
            }
            if (checkOutStr != null && !checkOutStr.isEmpty()) {
                reservation.setCheckOut(LocalDate.parse(checkOutStr));
            }
        } catch (DateTimeParseException e) {
            // handled below via validation errors
        }

        List<String> errors;
        if ("update".equals(action)) {
            errors = reservationService.updateReservation(reservation);
        } else {
            errors = reservationService.createReservation(reservation);
        }

        if (!errors.isEmpty()) {
            req.setAttribute("errors", errors);
            req.setAttribute("reservation", reservation);
            if ("update".equals(action)) {
                req.setAttribute("isEdit", true);
            }
            req.getRequestDispatcher("/WEB-INF/jsp/reservationForm.jsp").forward(req, resp);
        } else {
            req.setAttribute("reservation", reservation);
            req.getRequestDispatcher("/WEB-INF/jsp/reservationSuccess.jsp").forward(req, resp);
        }
    }

    private boolean ensureAuthenticated(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("currentUser") : null;
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return false;
        }
        return true;
    }
}
