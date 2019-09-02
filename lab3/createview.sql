CREATE VIEW CA_NY_Passengers AS
       SELECT CustID, f.AirlineID, f.FlightNum
       FROM Flights f, Tickets t
       WHERE f.AirlineID = t.AirlineID 
       	     AND f.FlightNum = t.FlightNum
             AND f.Origin IN
	     	 (SELECT AirportID
		 	 FROM Airports
		 	 WHERE State = 'CA')
	     AND f.Destination IN
	     	 (SELECT AirportID
		 	 FROM Airports
		 	 WHERE State = 'NY');
