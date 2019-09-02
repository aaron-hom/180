SELECT AirlineName, FlightNum, DepartureTime, ArrivalTime
FROM Airlines a, Flights f
WHERE a.AirlineID = f.AirlineID AND Origin = 'SFO' AND Destination = 'JFK';
