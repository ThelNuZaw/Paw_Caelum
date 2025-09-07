USE Paw_Caelum;
CREATE TABLE FAVORITE(
    Dog_id INT NOT NULL,
    Walker_id INT NOT NULL,
    Location TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(Dog_id, Walker_id),
    FOREIGN KEY(Walker_id) REFERENCES User(User_id),
    FOREIGN KEY(Dog_id) REFERENCES Dogs(Dog_id)
);

ALTER TABLE Paw_Caelum.FAVORITE
RENAME COLUMN Location TO creation_at;
SELECT * FROM Paw_Caelum.FAVORITE;