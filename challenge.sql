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