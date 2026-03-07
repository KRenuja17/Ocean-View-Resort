package org.example.hotel.model;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Unit tests for the User model.
 * Tests getter/setter behaviour and field integrity — no DB required.
 */
public class UserTest {

    private User user;

    @Before
    public void setUp() {
        user = new User();
        user.setId(1);
        user.setUsername("admin");
        user.setPassword("admin123");
        user.setRole("ADMIN");
    }

    // --- Field getters / setters ---

    @Test
    public void testGetId() {
        assertEquals(1, user.getId());
    }

    @Test
    public void testSetId() {
        user.setId(5);
        assertEquals(5, user.getId());
    }

    @Test
    public void testGetUsername() {
        assertEquals("admin", user.getUsername());
    }

    @Test
    public void testSetUsername() {
        user.setUsername("staff01");
        assertEquals("staff01", user.getUsername());
    }

    @Test
    public void testGetPassword() {
        assertEquals("admin123", user.getPassword());
    }

    @Test
    public void testSetPassword() {
        user.setPassword("newpassword");
        assertEquals("newpassword", user.getPassword());
    }

    @Test
    public void testGetRole() {
        assertEquals("ADMIN", user.getRole());
    }

    @Test
    public void testSetRole() {
        user.setRole("STAFF");
        assertEquals("STAFF", user.getRole());
    }

    // --- Object state ---

    @Test
    public void testDefaultConstructorProducesNullFields() {
        User empty = new User();
        assertNull("username should be null by default", empty.getUsername());
        assertNull("password should be null by default", empty.getPassword());
        assertNull("role should be null by default", empty.getRole());
    }

    @Test
    public void testUsernameIsNotEmpty() {
        assertNotNull(user.getUsername());
        assertFalse("Username should not be blank",
                user.getUsername().trim().isEmpty());
    }

    @Test
    public void testRoleIsAdminOrStaff() {
        String role = user.getRole();
        assertTrue("Role must be ADMIN or STAFF",
                "ADMIN".equals(role) || "STAFF".equals(role));
    }

    @Test
    public void testPasswordIsNotEmpty() {
        assertNotNull(user.getPassword());
        assertFalse("Password should not be blank",
                user.getPassword().trim().isEmpty());
    }

    @Test
    public void testCanUpdateRoleFromAdminToStaff() {
        assertEquals("ADMIN", user.getRole());
        user.setRole("STAFF");
        assertEquals("STAFF", user.getRole());
    }
}
