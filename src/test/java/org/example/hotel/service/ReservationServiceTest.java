package org.example.hotel.service;

import org.example.hotel.dao.ReservationDao;
import org.example.hotel.model.Reservation;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;


public class ReservationServiceTest {

    private ReservationDao mockDao;
    private ReservationService service;

    @Before
    public void setUp() {
        mockDao = Mockito.mock(ReservationDao.class);
        service = new ReservationService(mockDao);
    }

    // --- Helper: build a valid reservation ---
    private Reservation validReservation() {
        Reservation r = new Reservation();
        r.setReservationNumber("OVRN1");
        r.setGuestName("Kavindu Silva");
        r.setAddress("42 Galle Road, Colombo");
        r.setContactNumber("0771234567");
        r.setRoomType("STANDARD");
        r.setCheckIn(LocalDate.now().plusDays(1));
        r.setCheckOut(LocalDate.now().plusDays(3)); // 2 nights
        return r;
    }

    // =====================================================================
    // createReservation — validation
    // =====================================================================

    @Test
    public void testCreateValidReservationReturnsNoErrors() {
        Reservation r = validReservation();
        List<String> errors = service.createReservation(r);
        assertTrue("Valid reservation should produce no errors", errors.isEmpty());
    }

    @Test
    public void testCreateReservationCallsDao() {
        Reservation r = validReservation();
        service.createReservation(r);
        verify(mockDao, times(1)).create(r);
    }

    @Test
    public void testCreateReservationCalculatesTotalAmount() {
        Reservation r = validReservation(); // STANDARD, 2 nights = 15000 x 2 = 30000
        service.createReservation(r);
        assertEquals("Total should be 30000 for STANDARD x 2 nights",
                new BigDecimal("30000.00"), r.getTotalAmount());
    }

    @Test
    public void testCreateDeluxeReservationCalculatesCorrectTotal() {
        Reservation r = validReservation();
        r.setRoomType("DELUXE"); // 25000 x 2 nights = 50000
        service.createReservation(r);
        assertEquals(new BigDecimal("50000.00"), r.getTotalAmount());
    }

    @Test
    public void testCreateSuiteReservationCalculatesCorrectTotal() {
        Reservation r = validReservation();
        r.setRoomType("SUITE"); // 40000 x 2 nights = 80000
        service.createReservation(r);
        assertEquals(new BigDecimal("80000.00"), r.getTotalAmount());
    }

    @Test
    public void testCreateReservationFailsWhenGuestNameBlank() {
        Reservation r = validReservation();
        r.setGuestName("   ");
        List<String> errors = service.createReservation(r);
        assertFalse("Should have errors for blank guest name", errors.isEmpty());
        assertTrue(errors.stream().anyMatch(e -> e.contains("Guest name")));
    }

    @Test
    public void testCreateReservationFailsWhenReservationNumberNull() {
        Reservation r = validReservation();
        r.setReservationNumber(null);
        List<String> errors = service.createReservation(r);
        assertFalse(errors.isEmpty());
        assertTrue(errors.stream().anyMatch(e -> e.contains("Reservation number")));
    }

    @Test
    public void testCreateReservationFailsWhenAddressBlank() {
        Reservation r = validReservation();
        r.setAddress("");
        List<String> errors = service.createReservation(r);
        assertFalse(errors.isEmpty());
        assertTrue(errors.stream().anyMatch(e -> e.contains("Address")));
    }

    @Test
    public void testCreateReservationFailsWhenContactNumberInvalidFormat() {
        Reservation r = validReservation();
        r.setContactNumber("abc!!!");
        List<String> errors = service.createReservation(r);
        assertFalse(errors.isEmpty());
        assertTrue(errors.stream().anyMatch(e -> e.contains("Contact number")));
    }

    @Test
    public void testCreateReservationFailsWhenRoomTypeInvalid() {
        Reservation r = validReservation();
        r.setRoomType("PENTHOUSE"); // not a valid type
        List<String> errors = service.createReservation(r);
        assertFalse(errors.isEmpty());
        assertTrue(errors.stream().anyMatch(e -> e.contains("room type")));
    }

    @Test
    public void testCreateReservationFailsWhenCheckInIsInPast() {
        Reservation r = validReservation();
        r.setCheckIn(LocalDate.now().minusDays(1));
        List<String> errors = service.createReservation(r);
        assertFalse(errors.isEmpty());
        assertTrue(errors.stream().anyMatch(e -> e.contains("past")));
    }

    @Test
    public void testCreateReservationFailsWhenCheckOutBeforeCheckIn() {
        Reservation r = validReservation();
        r.setCheckIn(LocalDate.now().plusDays(5));
        r.setCheckOut(LocalDate.now().plusDays(3));
        List<String> errors = service.createReservation(r);
        assertFalse(errors.isEmpty());
        assertTrue(errors.stream().anyMatch(e -> e.contains("Check-out")));
    }

    @Test
    public void testCreateReservationFailsWhenCheckInAndCheckOutSameDay() {
        Reservation r = validReservation();
        LocalDate same = LocalDate.now().plusDays(2);
        r.setCheckIn(same);
        r.setCheckOut(same);
        List<String> errors = service.createReservation(r);
        assertFalse("Same-day check-in/out should fail", errors.isEmpty());
    }

    @Test
    public void testCreateReservationFailsWhenDatesAreNull() {
        Reservation r = validReservation();
        r.setCheckIn(null);
        r.setCheckOut(null);
        List<String> errors = service.createReservation(r);
        assertFalse(errors.isEmpty());
        assertTrue(errors.stream().anyMatch(e -> e.contains("dates are required")));
    }

    @Test
    public void testCreateReservationDoesNotCallDaoWhenValidationFails() {
        Reservation r = validReservation();
        r.setGuestName(null);
        service.createReservation(r);
        verify(mockDao, never()).create(any());
    }

    // =====================================================================
    // updateReservation
    // =====================================================================

    @Test
    public void testUpdateValidReservationReturnsNoErrors() {
        Reservation r = validReservation();
        List<String> errors = service.updateReservation(r);
        assertTrue(errors.isEmpty());
    }

    @Test
    public void testUpdateReservationCallsDao() {
        Reservation r = validReservation();
        service.updateReservation(r);
        verify(mockDao, times(1)).update(r);
    }

    @Test
    public void testUpdateReservationRecalculatesTotal() {
        Reservation r = validReservation();
        r.setRoomType("SUITE"); // 40000 x 2 = 80000
        service.updateReservation(r);
        assertEquals(new BigDecimal("80000.00"), r.getTotalAmount());
    }

    @Test
    public void testUpdateReservationFailsWhenContactInvalid() {
        Reservation r = validReservation();
        r.setContactNumber("INVALID");
        List<String> errors = service.updateReservation(r);
        assertFalse(errors.isEmpty());
        verify(mockDao, never()).update(any());
    }

    // =====================================================================
    // deleteReservation
    // =====================================================================

    @Test
    public void testDeleteReservationCallsDao() {
        service.deleteReservation("OVRN1");
        verify(mockDao, times(1)).delete("OVRN1");
    }

    // =====================================================================
    // findByReservationNumber
    // =====================================================================

    @Test
    public void testFindByReservationNumberReturnsReservation() {
        Reservation r = validReservation();
        when(mockDao.findByReservationNumber("OVRN1")).thenReturn(Optional.of(r));

        Optional<Reservation> result = service.findByReservationNumber("OVRN1");

        assertTrue("Should find the reservation", result.isPresent());
        assertEquals("OVRN1", result.get().getReservationNumber());
    }

    @Test
    public void testFindByReservationNumberReturnsEmptyWhenNotFound() {
        when(mockDao.findByReservationNumber("OVRN999")).thenReturn(Optional.empty());

        Optional<Reservation> result = service.findByReservationNumber("OVRN999");

        assertFalse("Should return empty for unknown reservation number", result.isPresent());
    }

    // =====================================================================
    // generateReservationNumber
    // =====================================================================

    @Test
    public void testGenerateReservationNumberStartsWithOVRN() {
        when(mockDao.getLastId()).thenReturn(0);
        String number = service.generateReservationNumber();
        assertTrue("Reservation number should start with OVRN",
                number.startsWith("OVRN"));
    }

    @Test
    public void testGenerateReservationNumberIncrementsFromLastId() {
        when(mockDao.getLastId()).thenReturn(5);
        String number = service.generateReservationNumber();
        assertEquals("OVRN6", number);
    }

    @Test
    public void testGenerateReservationNumberWhenTableIsEmpty() {
        when(mockDao.getLastId()).thenReturn(0);
        String number = service.generateReservationNumber();
        assertEquals("OVRN1", number);
    }
}
