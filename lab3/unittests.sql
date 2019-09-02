INSERT INTO Tickets
       VALUES (179, 141, 'VRD', 120, 'J20', 240.67, TRUE);

INSERT INTO Flights
       VALUES ('LPT', 350, 'SFO', 'JAX', '8:00:00', '11:30:00');

INSERT INTO Tickets
       VALUES (179, 101, 'ASA', 110, 'J20', 240.67, TRUE);

UPDATE Tickets
       SET Cost = Cost-10
       WHERE CustID = 170;

UPDATE Tickets
       SET Cost = -5
       WHERE CustID = 137;

UPDATE Flights
       SET DepartureTime = '7:00:00'
       WHERE AirlineID = 'UAL' AND FlightNum = 140;

UPDATE Flights
       SET DepartureTime = '9:00:00'
       WHERE ArrivalTime = '8:00:00';

UPDATE Airports
       SET City = 'Knoxville'
       WHERE State = 'TN';

UPDATE Airports
       SET City = 'Knoxville'
       WHERE State = 'CA';

UPDATE Flights
       SET Destination = 'JFK'
       WHERE FlightNum = 240;

UPDATE Flights
       SET Origin = 'LAX'
       WHERE AirlineID = 'UAL' AND FlightNum = 140;
 
