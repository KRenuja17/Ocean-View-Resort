package org.example.hotel.service;

import org.example.hotel.dao.ReservationDao;
import org.example.hotel.model.Reservation;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReservationService {

    private final ReservationDao reservationDao;
    private final Map<String, BigDecimal> roomRates = new HashMap<>();

    public ReservationService(ReservationDao reservationDao) {
        this.reservationDao = reservationDao;
        roomRates.put("STANDARD", new BigDecimal("100.00"));
        roomRates.put("DELUXE", new BigDecimal("180.00"));
        roomRates.put("SUITE", new BigDecimal("250.00"));
    }

    public List<String> createReservation(Reservation reservation) {
        List<String> errors = validate(reservation);
        if (!errors.isEmpty()) {
            return errors;
        }

        long nights = ChronoUnit.DAYS.between(reservation.getCheckIn(), reservation.getCheckOut());
        BigDecimal rate = roomRates.get(reservation.getRoomType());
        BigDecimal total = rate.multiply(new BigDecimal(nights));
        reservation.setTotalAmount(total);

        try {
            reservationDao.create(reservation);
        } catch (RuntimeException e) {
            if (e.getCause() instanceof java.sql.SQLIntegrityConstraintViolationException) {
                errors.add("Reservation number " + reservation.getReservationNumber() + " already exists.");
                return errors;
            } else {
                throw e;
            }
        }
        return errors;
    }

    private List<String> validate(Reservation r) {
        List<String> errors = new ArrayList<>();

        if (isBlank(r.getReservationNumber())) {
            errors.add("Reservation number is required.");
        }
        if (isBlank(r.getGuestName())) {
            errors.add("Guest name is required.");
        }
        if (isBlank(r.getAddress())) {
            errors.add("Address is required.");
        }
        if (isBlank(r.getContactNumber())) {
            errors.add("Contact number is required.");
        } else if (!r.getContactNumber().matches("[0-9+\\- ]{7,20}")) {
            errors.add("Contact number format is invalid.");
        }
        if (isBlank(r.getRoomType()) || !roomRates.containsKey(r.getRoomType())) {
            errors.add("Please select a valid room type.");
        }
        LocalDate in = r.getCheckIn();
        LocalDate out = r.getCheckOut();
        if (in == null || out == null) {
            errors.add("Check-in and check-out dates are required.");
        } else {
            if (out.isBefore(in) || !out.isAfter(in)) {
                errors.add("Check-out date must be after check-in date.");
            }
            if (in.isBefore(LocalDate.now())) {
                errors.add("Check-in date cannot be in the past.");
            }
        }

        return errors;
    }

    private boolean isBlank(String s) {
        return s == null || s.trim().isEmpty();
    }
}
