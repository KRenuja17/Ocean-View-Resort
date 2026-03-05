package org.example.hotel.dao;

import org.example.hotel.model.Reservation;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface ReservationDao {

    void create(Reservation reservation);

    void update(Reservation reservation);

    void delete(String reservationNumber);

    Optional<Reservation> findByReservationNumber(String reservationNumber);

    List<Reservation> findByCheckInDateRange(LocalDate from, LocalDate to);

    List<Reservation> findCurrentStays(LocalDate today);
}
