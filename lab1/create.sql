DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;

CREATE TABLE Airlines(
AirlineID CHAR(3),
AirlineName CHAR(30),
PRIMARY KEY (AirlineID)
);

CREATE TABLE Airports(
AirportID CHAR(3),
City VARCHAR(30),
State VARCHAR(30),
PRIMARY KEY (AirportID)
);

CREATE TABLE Flights(
AirlineID CHAR(3),
FlightNum INT,
Origin CHAR(3),
Destination CHAR(3),
DepatureTime TIME,
ArrivalTime TIME,
PRIMARY KEY(AirlineID, FlightNum)
);

CREATE TABLE Customers(
CustID INT,
CustName VARCHAR(30),
Status CHAR(1),
PRIMARY KEY(CustID)
);

CREATE TABLE Tickets(
TicketID INT,
CustID INT,
AirlineID CHAR(3),
FlightNum INT,
FlightDate DATE,
SeatNum CHAR(3),
Cost DECIMAL(7,2),
Paid BOOLEAN,
PRIMARY KEY(TicketID)
);



