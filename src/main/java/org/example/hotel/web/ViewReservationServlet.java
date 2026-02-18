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
import java.util.Optional;

public class ViewReservationServlet extends HttpServlet {

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
        req.getRequestDispatcher("/WEB-INF/jsp/viewReservation.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!ensureAuthenticated(req, resp)) {
            return;
        }

        String reservationNumber = req.getParameter("reservationNumber");
        Optional<Reservation> reservationOpt = reservationDao.findByReservationNumber(reservationNumber);

        if (reservationOpt.isPresent()) {
            req.setAttribute("reservation", reservationOpt.get());
        } else {
            req.setAttribute("error", "No reservation found for number: " + reservationNumber);
        }
        req.getRequestDispatcher("/WEB-INF/jsp/viewReservation.jsp").forward(req, resp);
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

