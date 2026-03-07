package org.example.hotel.service;

import org.example.hotel.dao.UserDao;
import org.example.hotel.model.User;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import java.util.Optional;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;


public class AuthServiceTest {

    private UserDao mockUserDao;
    private AuthService authService;

    @Before
    public void setUp() {
        mockUserDao = Mockito.mock(UserDao.class);
        authService = new AuthService(mockUserDao);
    }

    // --- Helper ---
    private User makeUser(String username, String role) {
        User u = new User();
        u.setId(1);
        u.setUsername(username);
        u.setPassword("secret");
        u.setRole(role);
        return u;
    }

    // =====================================================================
    // login — successful cases
    // =====================================================================

    @Test
    public void testLoginWithValidCredentialsReturnsUser() {
        User admin = makeUser("admin", "ADMIN");
        when(mockUserDao.findByUsernameAndPassword("admin", "secret"))
                .thenReturn(Optional.of(admin));

        Optional<User> result = authService.login("admin", "secret");

        assertTrue("Login should succeed with correct credentials", result.isPresent());
        assertEquals("admin", result.get().getUsername());
    }

    @Test
    public void testLoginReturnsCorrectRole() {
        User staff = makeUser("staff01", "STAFF");
        when(mockUserDao.findByUsernameAndPassword("staff01", "pass"))
                .thenReturn(Optional.of(staff));

        Optional<User> result = authService.login("staff01", "pass");

        assertTrue(result.isPresent());
        assertEquals("STAFF", result.get().getRole());
    }

    @Test
    public void testLoginTrimsUsernameBeforeQuerying() {
        User admin = makeUser("admin", "ADMIN");
        when(mockUserDao.findByUsernameAndPassword("admin", "secret"))
                .thenReturn(Optional.of(admin));

        // Pass username with surrounding whitespace
        Optional<User> result = authService.login("  admin  ", "secret");

        assertTrue("Login should succeed after trimming username", result.isPresent());
        verify(mockUserDao).findByUsernameAndPassword("admin", "secret");
    }

    // =====================================================================
    // login — failure cases
    // =====================================================================

    @Test
    public void testLoginWithWrongPasswordReturnsEmpty() {
        when(mockUserDao.findByUsernameAndPassword("admin", "wrongpass"))
                .thenReturn(Optional.empty());

        Optional<User> result = authService.login("admin", "wrongpass");

        assertFalse("Login should fail with wrong password", result.isPresent());
    }

    @Test
    public void testLoginWithUnknownUserReturnsEmpty() {
        when(mockUserDao.findByUsernameAndPassword("ghost", "anything"))
                .thenReturn(Optional.empty());

        Optional<User> result = authService.login("ghost", "anything");

        assertFalse("Login should fail for unknown user", result.isPresent());
    }

    @Test
    public void testLoginWithNullUsernameReturnsEmpty() {
        Optional<User> result = authService.login(null, "secret");
        assertFalse("Login should fail when username is null", result.isPresent());
        verify(mockUserDao, never()).findByUsernameAndPassword(any(), any());
    }

    @Test
    public void testLoginWithNullPasswordReturnsEmpty() {
        Optional<User> result = authService.login("admin", null);
        assertFalse("Login should fail when password is null", result.isPresent());
        verify(mockUserDao, never()).findByUsernameAndPassword(any(), any());
    }

    @Test
    public void testLoginWithBlankUsernameReturnsEmpty() {
        Optional<User> result = authService.login("   ", "secret");
        assertFalse("Login should fail when username is blank", result.isPresent());
        verify(mockUserDao, never()).findByUsernameAndPassword(any(), any());
    }

    @Test
    public void testLoginWithBlankPasswordReturnsEmpty() {
        Optional<User> result = authService.login("admin", "   ");
        assertFalse("Login should fail when password is blank", result.isPresent());
        verify(mockUserDao, never()).findByUsernameAndPassword(any(), any());
    }

    @Test
    public void testLoginWithEmptyStringsReturnsEmpty() {
        Optional<User> result = authService.login("", "");
        assertFalse("Login should fail with empty username and password", result.isPresent());
        verify(mockUserDao, never()).findByUsernameAndPassword(any(), any());
    }

    @Test
    public void testLoginDoesNotCallDaoWhenInputIsInvalid() {
        authService.login(null, null);
        authService.login("", "");
        authService.login("  ", "  ");
        // DAO should never have been called for any of these
        verify(mockUserDao, never()).findByUsernameAndPassword(any(), any());
    }
}
