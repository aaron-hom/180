SELECT DISTINCT AirlineID
FROM Flights
WHERE DepartureTime < '12:00'
ORDER BY AirlineID ASC;
