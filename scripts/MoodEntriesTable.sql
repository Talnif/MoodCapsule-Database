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

-- Adding FOREIGN KEY to Users (One User -> Many MoodEntries)
ALTER TABLE MoodEntries
ADD CONSTRAINT fk_user_mood
FOREIGN KEY (user_id)
REFERENCES Users(user_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- Adding FOREIGN KEY to Emojis
ALTER TABLE MoodEntries
ADD CONSTRAINT fk_emoji_mood
FOREIGN KEY (emoji_id)
REFERENCES Emojis(emoji_id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

-- RELATIONSHIP & CONSTRAINT TESTS
-- Valid insert (should work)
INSERT INTO MoodEntries (user_id, emoji_id, entry_text, entry_date)
VALUES (1, 1, 'One sentence into journal', '2026-03-05');

-- Invalid user test (should fail)
INSERT INTO MoodEntries (user_id, emoji_id, entry_text, entry_date)
VALUES (999, 1, 'Invalid user test', '2026-03-05');

-- Invalid emoji test (should fail)
INSERT INTO MoodEntries (user_id, emoji_id, entry_text, entry_date)
VALUES (1, 999, 'Invalid emoji test', '2026-03-05');

-- NOT NULL test (should fail)
INSERT INTO MoodEntries (user_id, emoji_id, entry_text)
VALUES (1, 1, NULL);

-- Test Update
UPDATE MoodEntries
SET entry_text = 'Had an amazing day today'
WHERE entry_id = 1;

-- Test Select
SELECT * FROM MoodEntries;