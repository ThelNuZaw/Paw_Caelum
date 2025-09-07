USE Paw_Caelum;
CREATE TABLE Make_Request(
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	Owner_Id INT NOT NULL,
    Walkrequest_ID INT NOT NULL,
    FOREIGN KEY(Owner_Id) REFERENCES User(User_ID),
    FOREIGN KEY(Walkrequest_ID) REFERENCES Walk_Request(Walkrequest_ID)
);
SELECT * FROM Paw_Caelum.Make_Request;