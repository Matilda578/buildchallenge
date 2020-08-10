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


SELECT B.TourName, E.TourName, T.TourName
FROM BOOKING B, TOUR T, EVENT E
INNER JOIN BOOKING
ON E.TourName = B.TourName


/*SELECT C.GivenName, C.Surname, B.TourName, T.Description, B.EventMonth*/

SELECT C.GivenName, C.Surname, T.TourName, T.Description, E.EventYear,E.EventMonth,E.EventDay,B.DateBooked,E.EventFee
FROM BOOKING B
INNER JOIN EVENT E
ON E.EventMonth = B.EventMonth 
and E.EventDay = B.EventDay
and E.EventYear = B.EventYear
and E.TourName = B.TourName
INNER JOIN CLIENT C 
ON C.ClientID = B.ClientID
INNER JOIN TOUR T
ON T.TourName = E.TourName


SELECT *
From BOOKING B
INNER JOIN EVENT E
ON E.EventMonth = B.EventMonth 
and E.EventDay = B.EventDay
and E.EventYear = B.EventYear
and E.TourName = B.TourName
INNER JOIN CLIENT C 
ON C.ClientID = B.ClientID
INNER JOIN TOUR T
ON T.TourName = E.TourName

/*Query2*/

SELECT COUNT(DateBooked), EventMonth, TourName
FROM BOOKING
GROUP BY EventMonth, TourName


/*Query3*/

SELECT ClientID, TourName, Payment
From    BOOKING
Where Payment > (Select AVG(Payment) FROM BOOKING);

/*Query4*/

CREATE VIEW [banana] AS
SELECT C.GivenName, C.Surname, T.TourName, T.Description, E.EventYear,E.EventMonth,E.EventDay,B.DateBooked,E.EventFee
FROM BOOKING B
INNER JOIN EVENT E
ON E.EventMonth = B.EventMonth 
and E.EventDay = B.EventDay
and E.EventYear = B.EventYear
and E.TourName = B.TourName
INNER JOIN CLIENT C 
ON C.ClientID = B.ClientID
INNER JOIN TOUR T
ON T.TourName = E.TourName;

Select *
FROM CLIENT

Select *
FROM BOOKING

Select *
FROM TOUR

SELECT Count(DateBooked)
FROM BOOKING

/* These tests indicate that the correct data is present. The linking between the tables is demonstrated in the initial queries.*/