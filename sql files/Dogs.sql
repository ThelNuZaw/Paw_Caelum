USE Paw_Caelum;
CREATE TABLE Dogs(
    Dog_Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Breed VARCHAR(50),
    Size ENUM('SMALL', 'MEDIUM', 'LARGE'),
    Age INT,
    Basic_info VARCHAR(200),
    Photo VARCHAR(500),
    Owner_Id INT NOT NULL,
    FOREIGN KEY (Owner_Id) REFERENCES User(User_ID)

);
CREATE INDEX idx_dogs_owner ON Paw_Caelum.Dogs(Owner_Id);

CREATE INDEX idx_dogs_size_owner ON Paw_Caelum.Dogs(Size, Owner_Id);
SELECT * FROM Paw_Caelum.Dogs;
