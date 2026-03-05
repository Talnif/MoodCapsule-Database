--
-- MoodCapsule Journal App
--

CREATE DATABASE IF NOT EXISTS moodcapsule;
USE moodcapsule;

DROP TABLE IF EXISTS Users;

--
-- 1. Create Users Table
--
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT,
    full_name VARCHAR(100),
    email VARCHAR(150),
    password_hash VARCHAR(255),
    reminder_allowed BOOLEAN DEFAULT TRUE,
    reminder_time TIME,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id)
);

--
-- 2. Add Constraints
--

/* Make important fields NOT NULL */
ALTER TABLE Users
MODIFY full_name VARCHAR(100) NOT NULL,
MODIFY email VARCHAR(150) NOT NULL,
MODIFY password_hash VARCHAR(255) NOT NULL;

/* Add UNIQUE constraint to email */
ALTER TABLE Users
ADD CONSTRAINT unique_email UNIQUE (email);

--Tests

-- INSERT TEST
INSERT INTO Users (full_name, email, password_hash, reminder_time)
VALUES ('Ujjwal Koirala', 'ujjwal@gmail.com', 'ujjwal*12345*$', '20:00:00');

-- Insert another user
INSERT INTO Users (full_name, email, password_hash, reminder_time)
VALUES ('Aryan p', 'aryan@gmail.com', 'aryan123', '21:00:00');

-- Check inserted users
SELECT * FROM Users;

-- UPDATE TEST
UPDATE Users
SET full_name = 'Aaditya Subedi'
WHERE user_id = 1;

-- Verify update
SELECT * FROM Users;

-- UNIQUE CONSTRAINT TEST (Should Fail)
-- Email must be unique
INSERT INTO Users (full_name, email, password_hash)
VALUES ('Lovepreet', 'ujjwal@gmail.com', 'ujjwal123');

-- NOT NULL TEST (Should Fail)
-- full_name cannot be NULL
INSERT INTO Users (email, password_hash)
VALUES ('capstone@gmail.com', '12345687');

-- DELETE TEST
DELETE FROM Users
WHERE user_id = 1;

-- Verify deletion
SELECT * FROM Users;