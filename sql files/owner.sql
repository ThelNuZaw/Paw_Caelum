USE Paw_Caelum;
CREATE TABLE OWNER (
    Owner_id INT PRIMARY KEY,
    Emergency_contact VARCHAR(45),
    FOREIGN KEY (Owner_id) REFERENCES User(User_id)
);

SELECT * FROM Paw_Caelum.OWNER;

