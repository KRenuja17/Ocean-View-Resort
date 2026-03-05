CREATE DATABASE IF NOT EXISTS ocean_view;
USE ocean_view;

CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role VARCHAR(20) NOT NULL
);

INSERT INTO users (username, password, role)
VALUES ('admin', 'admin123', 'ADMIN')
ON DUPLICATE KEY UPDATE username = username;

INSERT INTO users (username, password, role)
VALUES ('manager', 'manager123', 'MANAGER')
ON DUPLICATE KEY UPDATE username = username;

CREATE TABLE IF NOT EXISTS reservations (
  id INT AUTO_INCREMENT PRIMARY KEY,
  reservation_number VARCHAR(30) NOT NULL UNIQUE,
  guest_name VARCHAR(100) NOT NULL,
  address VARCHAR(255) NOT NULL,
  contact_number VARCHAR(20) NOT NULL,
  room_type VARCHAR(20) NOT NULL,
  check_in DATE NOT NULL,
  check_out DATE NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
