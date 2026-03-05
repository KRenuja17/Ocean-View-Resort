package org.example.hotel.dao;

import org.example.hotel.model.Reservation;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ReservationDaoImpl implements ReservationDao {

    private static final String INSERT_SQL =
            "INSERT INTO reservations (reservation_number, guest_name, address, contact_number, room_type, check_in, check_out, total_amount) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String UPDATE_SQL =
            "UPDATE reservations SET guest_name = ?, address = ?, contact_number = ?, room_type = ?, check_in = ?, check_out = ?, total_amount = ? WHERE reservation_number = ?";

    private static final String DELETE_SQL =
            "DELETE FROM reservations WHERE reservation_number = ?";

    private static final String SELECT_BY_RES_NO_SQL =
            "SELECT * FROM reservations WHERE reservation_number = ?";

    private static final String SELECT_BY_CHECKIN_RANGE_SQL =
            "SELECT * FROM reservations WHERE check_in BETWEEN ? AND ? ORDER BY check_in";

    private static final String SELECT_CURRENT_STAYS_SQL =
            "SELECT * FROM reservations WHERE ? BETWEEN check_in AND DATE_SUB(check_out, INTERVAL 1 DAY) ORDER BY check_in";

    @Override
    public void create(Reservation reservation) {
        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_SQL)) {

            ps.setString(1, reservation.getReservationNumber());
            ps.setString(2, reservation.getGuestName());
            ps.setString(3, reservation.getAddress());
            ps.setString(4, reservation.getContactNumber());
            ps.setString(5, reservation.getRoomType());
            ps.setDate(6, Date.valueOf(reservation.getCheckIn()));
            ps.setDate(7, Date.valueOf(reservation.getCheckOut()));
            ps.setBigDecimal(8, reservation.getTotalAmount());

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error creating reservation", e);
        }
    }

    @Override
    public void update(Reservation reservation) {
        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(UPDATE_SQL)) {

            ps.setString(1, reservation.getGuestName());
            ps.setString(2, reservation.getAddress());
            ps.setString(3, reservation.getContactNumber());
            ps.setString(4, reservation.getRoomType());
            ps.setDate(5, Date.valueOf(reservation.getCheckIn()));
            ps.setDate(6, Date.valueOf(reservation.getCheckOut()));
            ps.setBigDecimal(7, reservation.getTotalAmount());
            ps.setString(8, reservation.getReservationNumber());

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error updating reservation", e);
        }
    }

    @Override
    public void delete(String reservationNumber) {
        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(DELETE_SQL)) {

            ps.setString(1, reservationNumber);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting reservation", e);
        }
    }

    @Override
    public Optional<Reservation> findByReservationNumber(String reservationNumber) {
        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_RES_NO_SQL)) {

            ps.setString(1, reservationNumber);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapRow(rs));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error finding reservation", e);
        }
        return Optional.empty();
    }

    @Override
    public List<Reservation> findByCheckInDateRange(LocalDate from, LocalDate to) {
        List<Reservation> list = new ArrayList<>();
        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_CHECKIN_RANGE_SQL)) {

            ps.setDate(1, Date.valueOf(from));
            ps.setDate(2, Date.valueOf(to));
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapRow(rs));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error finding reservations by date range", e);
        }
        return list;
    }

    @Override
    public List<Reservation> findCurrentStays(LocalDate today) {
        List<Reservation> list = new ArrayList<>();
        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_CURRENT_STAYS_SQL)) {

            ps.setDate(1, Date.valueOf(today));
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapRow(rs));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error finding current stays", e);
        }
        return list;
    }

    private Reservation mapRow(ResultSet rs) throws SQLException {
        Reservation r = new Reservation();
        r.setId(rs.getInt("id"));
        r.setReservationNumber(rs.getString("reservation_number"));
        r.setGuestName(rs.getString("guest_name"));
        r.setAddress(rs.getString("address"));
        r.setContactNumber(rs.getString("contact_number"));
        r.setRoomType(rs.getString("room_type"));
        r.setCheckIn(rs.getDate("check_in").toLocalDate());
        r.setCheckOut(rs.getDate("check_out").toLocalDate());
        r.setTotalAmount(rs.getBigDecimal("total_amount"));
        return r;
    }
}
