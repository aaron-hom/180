ALTER TABLE Tickets
ADD FOREIGN KEY (CustID)
REFERENCES Customers (CustID);

ALTER TABLE Flights
ADD FOREIGN KEY (AirlineID)
REFERENCES Airlines (AirlineID);

ALTER TABLE Tickets
ADD FOREIGN KEY (AirlineID, FlightNum)
REFERENCES Flights (AirlineID, FlightNum);
