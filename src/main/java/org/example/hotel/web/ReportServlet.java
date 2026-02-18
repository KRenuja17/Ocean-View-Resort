package org.example.hotel.web;

import org.example.hotel.dao.ReservationDaoImpl;
import org.example.hotel.model.Reservation;
import org.example.hotel.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.Collections;
import java.util.List;

public class ReportServlet extends HttpServlet {

    private ReservationDaoImpl reservationDao;

    @Override
    public void init() {
        this.reservationDao = new ReservationDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!ensureAuthenticated(req, resp)) {
            return;
        }
        req.getRequestDispatcher("/WEB-INF/jsp/reports.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!ensureAuthenticated(req, resp)) {
            return;
        }

        String reportType = req.getParameter("reportType");
        List<Reservation> results = Collections.emptyList();

        if ("byDateRange".equals(reportType)) {
            try {
                LocalDate from = LocalDate.parse(req.getParameter("fromDate"));
                LocalDate to = LocalDate.parse(req.getParameter("toDate"));
                results = reservationDao.findByCheckInDateRange(from, to);
            } catch (DateTimeParseException e) {
                req.setAttribute("error", "Please provide valid from/to dates.");
            }
        } else if ("currentStays".equals(reportType)) {
            results = reservationDao.findCurrentStays(LocalDate.now());
        }

        req.setAttribute("reservations", results);
        req.getRequestDispatcher("/WEB-INF/jsp/reports.jsp").forward(req, resp);
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

