USE Paw_Caelum;
CREATE TABLE Walker(
    Walker_id INT PRIMARY KEY,
    Bio VARCHAR(255),
    Experience ENUM('beginner', 'intermediate', 'advanced') DEFAULT 'beginner',
    Zip_Code VARCHAR(15) NOT NULL,
   
    FOREIGN KEY(Walker_id) REFERENCES User(User_id)
);
 ALTER TABLE WALKER DROP COLUMN Status;
 SHOW INDEX FROM Paw_Caelum.Walker;
SELECT * FROM Walker;
