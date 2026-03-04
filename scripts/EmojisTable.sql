DROP TABLE IF exists Emojis; 

CREATE TABLE Emojis (
emoji_id INT PRIMARY KEY AUTO_INCREMENT, 
symbol VARCHAR(10) NOT NULL, 
description VARCHAR(50)
);


ALTER TABLE Emojis 
MODIFY description VARCHAR(50) NOT NULL; 


INSERT INTO Emojis (symbol, description) 
VALUES 
('😊', 'Happy'),
('😢', 'Sad'),
('😡', 'Angry'),
('😴', 'Tired'),
('😍', 'Loved');

SELECT * FROM Emojis;

UPDATE Emojis
SET description = 'Very Happy' 
WHERE emoji_id = 1;

SELECT * FROM Emojis;
