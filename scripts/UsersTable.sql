--
-- MoodCapsule Journal App
--

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

--
-- 3. Test Insert
--
INSERT INTO Users (full_name, email, password_hash, reminder_time)
VALUES ('Tom Smith', 'tom@gmail.com', 'tompwd*12345*$', '20:00:00');

--
-- 4. Test Select
--
SELECT * FROM Users;

--
-- 5. Test Update
--
UPDATE Users
SET full_name = 'John Barnes'
WHERE user_id = 1;

/* Check the new update */
SELECT * FROM Users;