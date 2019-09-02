DROP SCHEMA Lab2 CASCADE;
CREATE SCHEMA Lab2;

CREATE TABLE Airlines(
AirlineID CHAR(3),
AirlineName CHAR(30),
PRIMARY KEY (AirlineID),
UNIQUE (AirlineName)
);

CREATE TABLE Airports(
AirportID CHAR(3),
City VARCHAR(30) NOT NULL,
State VARCHAR(30) NOT NULL,
PRIMARY KEY (AirportID)
);

CREATE TABLE Flights(
AirlineID CHAR(3),
FlightNum INT,
Origin CHAR(3),
Destination CHAR(3),
DepartureTime TIME,
ArrivalTime TIME,
PRIMARY KEY(AirlineID, FlightNum),
UNIQUE (AirlineID, Origin, Destination, DepartureTime)
);

CREATE TABLE Customers(
CustID INT NOT NULL,
CustName VARCHAR(30) NOT NULL,
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
PRIMARY KEY(TicketID),
UNIQUE (CustID, AirlineID, FlightNum)
);
