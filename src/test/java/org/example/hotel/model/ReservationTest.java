package org.example.hotel.model;

import org.junit.Before;
import org.junit.Test;

import java.math.BigDecimal;
import java.time.LocalDate;

import static org.junit.Assert.*;

/**
 * Unit tests for the Reservation model.
 * Tests getter/setter behaviour and field integrity — no DB required.
 */
public class ReservationTest {

    private Reservation reservation;

    @Before
    public void setUp() {
        reservation = new Reservation();
        reservation.setId(1);
        reservation.setReservationNumber("OVRN1");
        reservation.setGuestName("Kavindu Silva");
        reservation.setAddress("42 Galle Road, Colombo");
        reservation.setContactNumber("0771234567");
        reservation.setRoomType("DELUXE");
        reservation.setCheckIn(LocalDate.of(2025, 6, 10));
        reservation.setCheckOut(LocalDate.of(2025, 6, 13));
        reservation.setTotalAmount(new BigDecimal("75000.00"));
    }

    // --- Field getters / setters ---

    @Test
    public void testGetId() {
        assertEquals(1, reservation.getId());
    }

    @Test
    public void testSetId() {
        reservation.setId(99);
        assertEquals(99, reservation.getId());
    }

    @Test
    public void testGetReservationNumber() {
        assertEquals("OVRN1", reservation.getReservationNumber());
    }

    @Test
    public void testSetReservationNumber() {
        reservation.setReservationNumber("OVRN42");
        assertEquals("OVRN42", reservation.getReservationNumber());
    }

    @Test
    public void testGetGuestName() {
        assertEquals("Kavindu Silva", reservation.getGuestName());
    }

    @Test
    public void testSetGuestName() {
        reservation.setGuestName("Amal Perera");
        assertEquals("Amal Perera", reservation.getGuestName());
    }

    @Test
    public void testGetAddress() {
        assertEquals("42 Galle Road, Colombo", reservation.getAddress());
    }

    @Test
    public void testSetAddress() {
        reservation.setAddress("10 Beach Road, Negombo");
        assertEquals("10 Beach Road, Negombo", reservation.getAddress());
    }

    @Test
    public void testGetContactNumber() {
        assertEquals("0771234567", reservation.getContactNumber());
    }

    @Test
    public void testSetContactNumber() {
        reservation.setContactNumber("0719876543");
        assertEquals("0719876543", reservation.getContactNumber());
    }

    @Test
    public void testGetRoomType() {
        assertEquals("DELUXE", reservation.getRoomType());
    }

    @Test
    public void testSetRoomType() {
        reservation.setRoomType("SUITE");
        assertEquals("SUITE", reservation.getRoomType());
    }

    @Test
    public void testGetCheckIn() {
        assertEquals(LocalDate.of(2025, 6, 10), reservation.getCheckIn());
    }

    @Test
    public void testSetCheckIn() {
        reservation.setCheckIn(LocalDate.of(2025, 7, 1));
        assertEquals(LocalDate.of(2025, 7, 1), reservation.getCheckIn());
    }

    @Test
    public void testGetCheckOut() {
        assertEquals(LocalDate.of(2025, 6, 13), reservation.getCheckOut());
    }

    @Test
    public void testSetCheckOut() {
        reservation.setCheckOut(LocalDate.of(2025, 7, 5));
        assertEquals(LocalDate.of(2025, 7, 5), reservation.getCheckOut());
    }

    @Test
    public void testGetTotalAmount() {
        assertEquals(new BigDecimal("75000.00"), reservation.getTotalAmount());
    }

    @Test
    public void testSetTotalAmount() {
        reservation.setTotalAmount(new BigDecimal("40000.00"));
        assertEquals(new BigDecimal("40000.00"), reservation.getTotalAmount());
    }

    // --- Object state ---

    @Test
    public void testDefaultConstructorProducesNullFields() {
        Reservation empty = new Reservation();
        assertNull("reservationNumber should be null by default", empty.getReservationNumber());
        assertNull("guestName should be null by default", empty.getGuestName());
        assertNull("roomType should be null by default", empty.getRoomType());
        assertNull("checkIn should be null by default", empty.getCheckIn());
        assertNull("checkOut should be null by default", empty.getCheckOut());
        assertNull("totalAmount should be null by default", empty.getTotalAmount());
    }

    @Test
    public void testTotalAmountIsNotNegative() {
        assertTrue("Total amount should be zero or positive",
                reservation.getTotalAmount().compareTo(BigDecimal.ZERO) >= 0);
    }

    @Test
    public void testCheckOutIsAfterCheckIn() {
        assertTrue("Check-out must be after check-in",
                reservation.getCheckOut().isAfter(reservation.getCheckIn()));
    }

    @Test
    public void testReservationNumberIsNotEmpty() {
        assertNotNull(reservation.getReservationNumber());
        assertFalse("Reservation number should not be blank",
                reservation.getReservationNumber().trim().isEmpty());
    }
}
