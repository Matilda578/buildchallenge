/*Matilda Goodison 101889190

Event ( EventYear, EventMonth, EventDay,)
PK (EventYear, EventMonth, EventDay)

Tour ( TourName, Description)
PK (TourName)

Booking (DateBooked, Payment)
PK (DateBooked)

Client (ClientID, Surname, GivenName, Gender)
PK (ClientID) */

CREATE TABLE TOUR(
TourName NVARCHAR (100)
, Description NVARCHAR(500)
, PRIMARY KEY (TourName)
);
CREATE TABLE CLIENT(
ClientID INT
, Surname NVARCHAR(100)
, GivenName NVARCHAR(100)
, GENDER NVARCHAR(1)
, PRIMARY KEY (ClientID)
);
CREATE TABLE EVENT(
 TourName NVARCHAR(100)
, EventMonth NVARCHAR(3)
, EventDay INT
, EventYear INT
, EventFee MONEY
, PRIMARY KEY (TourName, EventMonth, EventDay, EventYear)
, FOREIGN KEY (TourName) REFERENCES TOUR(TourName)
, CHECK (EventMonth In ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'))
);
CREATE TABLE BOOKING(
 ClientID INT
, TourName NVARCHAR(100)
, EventMonth NVARCHAR (3)
, EventDay INT
, EventYear INT
, Payment MONEY 
, DateBooked DATE
, PRIMARY KEY (ClientID, TourName, EventMonth, EventDay, EventYear)
, FOREIGN KEY (TourName) REFERENCES TOUR(TourName)
, FOREIGN KEY (ClientID) REFERENCES CLIENT(ClientID)
, FOREIGN KEY (TourName, EventMonth, EventDay, EventYear) REFERENCES EVENT (TourName, EventMonth, EventDay, EventYear)
, CHECK (Payment >0)
);


SELECT *
FROM sys.tables

INSERT INTO EVENT (TourName, EventMonth, EventDay, EventYear, EventFee) VALUES
('North','Jan', 9, 2016, 200),
('North','Feb', 13, 2016, 225),
('South', 'Jan', 9, 2016, 200),
('South', 'Jan', 16, 2016, 200),
('West','Jan', 29,	2016, 225);

INSERT INTO TOUR(TourName, Description) VALUES
('North',	'Tour of wineries and outlets of the Bedigo and Castlemaine region'),
('South',	'Tour of wineries and outlets of Mornington Penisula'),
('West',	'Tour of wineries and outlets of the Geelong and Otways region');

INSERT INTO CLIENT(ClientID, Surname, GivenName, Gender) VALUES
(101889190,	'Goodison', 'Matilda',	'F');
(2, 'Gamble', 'Ellyse',	'F'),
(3, 'Tan', 'Tilly', 'F');

INSERT INTO BOOKING (ClientId, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked) VALUES
(2, 'North', 'Jan',	9,	2016, 200, '2015-12-16'),
(1, 'North', 'Feb', 13,	2016, 225, '2016-01-08'),
(2, 'North', 'Feb',	13, 2016,125, '2016-01-14'), 
(3,	'North','Feb',	13,	2016, 225, '2016-02-03'),
(1,	'South', 'Jan', 9,	2016,200, '2015-12-10'),
(2,	'South', 'Jan',	16,2016,200, '2015-12-08'),
(3,	'South', 'Jan', 16, 2016, 200, '2016-01-09'),
(2,	'West', 'Jan', 29, 2016, 225,'2015-12-17'),
(3,	'West', 'Jan', 29, 2016, 200, '2015-12-18');

SELECT *
FROM CLIENT