SELECT FlightNum, AirlineID, count(Paid) as PaidTickets
FROM Tickets
WHERE Paid = True
GROUP BY AirlineID, FlightNum;
