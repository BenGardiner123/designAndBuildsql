-- BEN GARDINER 102151272

-- TASK 1 CREATE THE SCHEMA

/* EVENT(TourName, EventYear, EventMonth, EventDay,Fee)
PK: TourName, EventYear, EventMonth, EventDay
FK: TourName REFERENCES TOUR

BOOKING(ClientID, TourName, EventYear, EventMonth, EventDay, DateBooked, Payment)
PK: ClientID, TourName, EventYear, EventMonth, EventDay
FK: ClientID REFERENCES CLIENT 
FK: TourName, EventYear, EventMonth, EventDay REFERENCES EVENT


CLIENT(ClientID, Surname, GivenName, Gender)
PK: ClientID

TOUR(TourName, Descriotion)
PK: TourName */

-- TASK 2 ----------------------------------------------------------
/* DROP TABLE IF EXISTS BOOKING;
DROP TABLE IF EXISTS EVENT;
DROP TABLE IF EXISTS CLIENT;
DROP TABLE IF EXISTS Tour;
SELECT * 
FROM sys.tables; 

go   */
 


CREATE TABLE TOUR (
TourName NVARCHAR(100), 
Description NVARCHAR(500),
PRIMARY KEY (TourName)
);

CREATE TABLE CLIENT (
ClientID INT, 
Surname NVARCHAR(100) not NULL, 
GivenName NVARCHAR(100) not NULL, 
Gender NVARCHAR(1) CHECK (Gender in ( 'M', 'F', 'I') )NULL,
PRIMARY KEY (ClientID)
);


CREATE TABLE EVENT (
TourName NVARCHAR(100), 
EventYear INT CONSTRAINT Check_Event_EventYear CHECK (LEN(EventYear) = 4),
EventMonth NVARCHAR(3) CONSTRAINT Check_Event_EventMonth CHECK (EventMonth in ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')
),
EventDay INT CONSTRAINT Check_Event_EvENTdAY CHECK (EventDay >= 1 AND EventDay <= 31),
Fee MONEY CONSTRAINT Check_Event_Fee CHECK (Fee > 0) NOT NULL, 
PRIMARY KEY (TourName, EventYear, EventMonth, EventDay),
FOREIGN KEY (TourName) REFERENCES TOUR
);

CREATE TABLE BOOKING (
ClientId INT, 
TourName NVARCHAR(100),
EventYear INT CONSTRAINT Check_bOOKING_EVENTYEAR CHECK (LEN(EventYear) = 4),
EventMonth NVARCHAR(3) CONSTRAINT Check_bOOKING_EVENTMONTH CHECK (EventMonth in ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')
),
EventDay INT CONSTRAINT Check_bOOKING_EVENTDAY CHECK (EventDay >= 1 AND EventDay <= 31),
Payment  MONEY CONSTRAINT Check_BOOKING_PAYMENT CHECK (Payment > 0) NULL, 
DateBooked DATE NOT NULL,  
PRIMARY KEY (ClientID, TourName, EventYear, EventMonth, EventDay),
FOREIGN KEY (ClientID) REFERENCES CLIENT,
FOREIGN KEY (TourName, EventYear, EventMonth, EventDay) REFERENCES EVENT
);

go



INSERT INTO TOUR(TourName, Description) VALUES  
('North', 'Tour of wineries and outlets of the Bedigo and Castlemaine region'),
('South', 'Tour of wineries and outlets of Mornington Penisula'),
('West', 'Tour of wineries and outlets of the Geelong and Otways region');

INSERT INTO CLIENT(ClientID, Surname, GivenName, Gender) VALUES
('1','Price','Taylor','M'),
('2','Gamble','Ellyse','F'),
('3','Tan','Tilly','F'),
('102151272', 'Gardiner', 'Ben', 'M');

INSERT INTO EVENT(TourName, EventYear, EventMonth, EventDay,Fee) VALUES
('North','2016', 'Jan','9','200'),
('North','2016','Feb','13','225'),
('South','2016','Jan','9','200'),
('South','2016','Jan','16','200'),
('West','2016','Jan','29','225');

INSERT INTO BOOKING(ClientID, TourName, EventYear, EventMonth, EventDay, DateBooked, Payment) VALUES
('1','North','2016','Jan',  '9', '2015-12-10',	'200'),
('2','North','2016','Jan',	'9', '2015-12-16',	'200'),
('1','North','2016','Feb',	'13', '2016-01-08',	'225'),
('2','North','2016','Feb',	'13', '2016-01-14',	'125'),
('3','North','2016','Feb',	'13', '2016-02-03',	'225'),
('1','South','2016','Jan',	'9', '2015-12-10',	'200'),
('2','South','2016','Jan',	'16', '2015-12-18',	'200'),
('3','South','2016','Jan',	'16',  '2016-01-09','200'),
('2','West','2016',	'Jan',	'29', '2015-12-17',	'225'),
('3','West','2016',	'Jan',	'29', '2015-12-18',	'200');  

GO
 
SELECT *
FROM client;  
