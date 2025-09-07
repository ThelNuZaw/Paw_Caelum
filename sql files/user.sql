USE Paw_Caelum;
CREATE TABLE User (
    User_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birthday DATE,
    email VARCHAR(255) UNIQUE,
    address VARCHAR(255),
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Phone VARCHAR(45)
);

ALTER TABLE Paw_Caelum.User ADD password VARCHAR(50) UNIQUE;
ALTER TABLE Paw_Caelum.User ADD role ENUM('Admin','Owner', 'Walker') NOT NULL DEFAULT 'Owner';
ALTER TABLE User MODIFY role ENUM('Admin','Owner', 'Walker')NOT NULL DEFAULT 'Owner';
ALTER TABLE Paw_Caelum.User ADD COLUMN Zip VARCHAR(10);

SELECT * FROM Paw_Caelum.User;

SHOW INDEX FROM Paw_Caelum.User;
CREATE INDEX idx_user_role ON Paw_Caelum.User(role);
CREATE INDEX idx_user_zip_userid ON Paw_Caelum.User(Zip, User_Id);

