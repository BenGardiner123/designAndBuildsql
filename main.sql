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


/* CREATE TABLE TOUR (
TourName NVARCHAR(100), 
Description NVARCHAR(500),
PRIMARY KEY (TourName)
);

CREATE TABLE CLIENT (
ClientID INT, 
Surname NVARCHAR(100) not NULL, 
GivenName NVARCHAR(100) not NULL, 
Gender NVARCHAR(1) CHECK (Gender = 'M''F''I') NULL,
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





SELECT * 
FROM sys.tables; */

-- ------------------------------------------------------------------------
