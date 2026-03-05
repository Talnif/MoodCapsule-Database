-- Drop if exists
DROP TABLE IF EXISTS MoodEntries;

-- Create MoodEntries table
CREATE TABLE MoodEntries (
    entry_id INT AUTO_INCREMENT,
    user_id INT,
    emoji_id INT,
    entry_text VARCHAR(255),
    entry_date DATE,
    PRIMARY KEY (entry_id)
);

-- Making important fields NOT NULL
ALTER TABLE MoodEntries
MODIFY user_id INT NOT NULL,
MODIFY emoji_id INT NOT NULL,
MODIFY entry_text VARCHAR(255) NOT NULL,
MODIFY entry_date DATE NOT NULL;

-- Adding FOREIGN KEY to Users
ALTER TABLE MoodEntries
ADD CONSTRAINT unique_user
FOREIGN KEY (user_id)
REFERENCES Users(user_id);

-- Adding FOREIGN KEY to Emojis
ALTER TABLE MoodEntries
ADD CONSTRAINT unique_emoji
FOREIGN KEY (emoji_id)
REFERENCES Emojis(emoji_id);

-- Test insert
INSERT INTO MoodEntries (user_id, emoji_id, entry_text, entry_date)
VALUES (1, 1, 'One sentence into journal', '2026-03-05');

-- Test Update

UPDATE MoodEntries
SET entry_text = 'Had an amazing day today'
WHERE entry_id = 1;

-- Test Select
SELECT * FROM MoodEntries;
