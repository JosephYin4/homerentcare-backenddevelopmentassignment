-- SQL Schema for HomeRentCare
CREATE DATABASE homerentcare;

USE homerentcare;

CREATE TABLE User_Details
(
 userID        unsigned int NOT NULL ,
 typeofUser    varchar(15) NOT NULL ,
 fullName      varchar(45) NOT NULL ,
 contactNumber varchar(15) NOT NULL ,
 email        varchar(45) NOT NULL ,

PRIMARY KEY (userID)
);

INSERT INTO User_Details (typeofUser, fullName, contactNumber, email) VALUES
('homeowner', 'Alice Johnson', '123-456-7890', 'alice.johnson@example.com'),
('homeowner', 'Bob Smith', '234-567-8901', 'bob.smith@example.com'),
('maintenant', 'Charlie Brown', '345-678-9012', 'charlie.brown@example.com'),
('maintenant', 'Diana Prince', '456-789-0123', 'diana.prince@example.com'),
('staff', 'Ethan Hunt', '567-890-1234', 'ethan.hunt@example.com'),
('staff', 'Fiona Glenanne', '678-901-2345', 'fiona.glenanne@example.com'),
('agent', 'George Lucas', '789-012-3456', 'george.lucas@example.com'),
('agent', 'Hannah Montana', '890-123-4567', 'hannah.montana@example.com'),
('homeowner', 'Ivy League', '901-234-5678', 'ivy.league@example.com'),
('staff', 'Jack Sparrow', '012-345-6789', 'jack.sparrow@example.com');


CREATE TABLE Property_Details (
    propertyID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nameofProperty VARCHAR(45) NOT NULL,
    address VARCHAR(150) NOT NULL,
    postalCode VARCHAR(10) NOT NULL,
    numberofBedrooms TINYINT UNSIGNED NULL,
    numberofBathrooms TINYINT UNSIGNED NULL,
    carparkLots TINYINT UNSIGNED NULL,
    amenities TEXT NULL,

    PRIMARY KEY (propertyID)
);

INSERT INTO Property_Details (nameofProperty, address, postalCode, numberofBedrooms, numberofBathrooms, carparkLots, amenities) VALUES
('Sunshine Villa', '123 Jalan Skudai, Johor Bahru', '81200', 4, 3, 2, 'Pool, Gym'),
('Green Haven', '456 Jalan Taman Perling, Johor Bahru', '81200', 3, 2, 1, 'Garden, Playground'),
('City View Apartment', '789 Jalan Sutera, Johor Bahru', '81300', 2, 2, 1, 'Gym, 24/7 Security'),
('Serenity Home', '101 Jalan Tebrau, Johor Bahru', '80300', 5, 4, 3, 'Pool, BBQ Area'),
('Cozy Corner', '202 Jalan Dato Abdullah Tahir, Johor Bahru', '80300', 2, 1, 1, 'Close to MRT'),
('Tropical Retreat', '303 Jalan Sg. Abong, Johor Bahru', '81200', 4, 3, 2, 'Garden, Wi-Fi'),
('Family Residence', '404 Jalan Maju, Johor Bahru', '80300', 3, 2, 2, 'Playground, Gym'),
('Urban Oasis', '505 Jalan Larkin, Johor Bahru', '80300', 2, 2, 1, 'Swimming Pool, Parking'),
('Luxury Condo', '606 Jalan Adda, Johor Bahru', '81100', 3, 2, 1, 'Gym, Security'),
('Elegant Suites', '707 Jalan Taman Molek, Johor Bahru', '81100', 1, 1, 1, 'Close to shopping mall');


CREATE TABLE Tenancy_Details (
    tenancyID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    dateStarted DATE NOT NULL,
    durationofTenancy INT NOT NULL,
    baserentalAmount DECIMAL(10, 2) NOT NULL,
    depositAmount DECIMAL(10, 2) NOT NULL,
    subtenantsFullName VARCHAR(150) NOT NULL,
    propertyID INT UNSIGNED NOT NULL,
    userID INT UNSIGNED NOT NULL,

    PRIMARY KEY (tenancyID),
    KEY FK_Property (propertyID),
    CONSTRAINT FK_Property FOREIGN KEY (propertyID) REFERENCES Property_Details (propertyID),
    KEY FK_User (userID),
    CONSTRAINT FK_User FOREIGN KEY (userID) REFERENCES User_Details (userID)
);

INSERT INTO Tenancy_Details (dateStarted, durationofTenancy, baserentalAmount, depositAmount, subtenantsFullName, propertyID, userID) VALUES
('2023-01-15', 12, 1500.00, 3000.00, 'Alice Wong, John Tan', 1, 1),
('2023-02-20', 24, 2000.00, 4000.00, 'Michael Tan, Sarah Lee', 2, 2),
('2023-03-05', 6, 1200.00, 2400.00, 'Siti Rahman, Omar Ali', 3, 3),
('2023-04-10', 18, 2500.00, 5000.00, 'John Doe, Jane Smith', 4, 4),
('2023-05-12', 12, 1800.00, 3600.00, 'Fatima Ali, Rina Hassan', 5, 5),
('2023-06-01', 36, 2200.00, 4400.00, 'Rajesh Kumar, Nisha Patel', 6, 1),
('2023-07-15', 12, 1600.00, 3200.00, 'Emma Johnson, Chris Lim', 7, 2),
('2023-08-20', 24, 2100.00, 4200.00, 'David Lim, Hannah Lee', 8, 3),
('2023-09-10', 30, 1900.00, 3800.00, 'Zara Khan, Ali Rizwan', 9, 4),
('2023-10-05', 6, 1300.00, 2600.00, 'Maya Chen, Anil Singh', 10, 5);










