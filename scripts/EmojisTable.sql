DROP TABLE IF exists Emojis; 

CREATE TABLE Emojis (
emoji_id INT PRIMARY KEY AUTO_INCREMENT, 
symbol VARCHAR(10) NOT NULL, 
description VARCHAR(50)
);


ALTER TABLE Emojis 
MODIFY description VARCHAR(50) NOT NULL; 


-- INSERT TEST
INSERT INTO Emojis (symbol, description)
VALUES
('😊', 'Happy'),
('😢', 'Sad'),
('😡', 'Angry'),
('😴', 'Tired'),
('😍', 'Loved');

-- Check inserted data
SELECT * FROM Emojis;

-- UPDATE TEST
UPDATE Emojis
SET description = 'Very Happy'
WHERE emoji_id = 1;

-- Verify update
SELECT * FROM Emojis;

-- ADDITIONAL INSERT TEST
INSERT INTO Emojis (symbol, description)
VALUES ('😎', 'Cool');

-- Verify new row
SELECT * FROM Emojis;

-- CONSTRAINT TEST (SHOULD FAIL)
-- description is NOT NULL
INSERT INTO Emojis (symbol)
VALUES ('🤔');

-- DELETE TEST
DELETE FROM Emojis
WHERE emoji_id = 6;

-- Verify deletion
SELECT * FROM Emojis;