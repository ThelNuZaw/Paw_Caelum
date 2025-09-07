USE Paw_Caelum;
CREATE TABLE OWNER_WALKER_RATING(
    rating_ID INT AUTO_INCREMENT PRIMARY KEY,
    Owner_id INT NOT NULL,
    Walker_id INT NOT NULL,
    Comment TEXT,
    RatingScore INT CHECK(RatingScore >= 1 and RatingScore <= 5),
    FOREIGN KEY(Owner_id) REFERENCES User(User_id),
    FOREIGN KEY(Walker_id) REFERENCES User(User_id)
);

SELECT * FROM Paw_Caelum.OWNER_WALKER_RATING;