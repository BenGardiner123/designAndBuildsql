-- BEN GARDINER 102151272

-- TASK 1 CREATE THE SCHEMA

/* EVENT(EventYear, EventMonth, EventDay,Fee)
PK: TourName, EventYear, EventMonth, EventDay
FK: TourName REFERENCES TOUR

BOOKING(DateBooked, Payment)
PK: ClientID, TourName, EventYear, EventMonth, EventDay
FK: ClientID REFERENCES CLIENT 
FK: TourName, EventYear, EventMonth, EventDay REFERENCES EVENT


CLIENT(ClientID, Surname, GivenName, Gender)
PK: ClientID


TOUR(TourName, Descriotion)
PK: TourName */

