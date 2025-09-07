USE Paw_Caelum;
CREATE TABLE Walk_Request(
    Walkrequest_ID INT AUTO_INCREMENT PRIMARY KEY,
    Dog_ID INT NOT NULL,
    Walker_ID INT,
    Status ENUM('open', 'accepted', 'completed'),
    price DECIMAL(10,2),
    duration INT,
    note TEXT,
    FOREIGN KEY(Dog_ID) REFERENCES Dogs(Dog_ID),
    FOREIGN KEY(Walker_ID) REFERENCES User(User_ID)
);

CREATE INDEX idx_wr_status_price_dog ON Paw_Caelum.Walk_Request(Status, Price, Dog_Id);

SHOW INDEX FROM Paw_Caelum.Walk_Request;
SELECT * FROM Paw_Caelum.Walk_Request;