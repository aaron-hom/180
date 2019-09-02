BEGIN TRANSACTION
ISOLATION LEVEL SERIALIZABLE;
UPDATE Tickets AS t
       SET SeatNum = n.SeatNum, Paid = FALSE
       FROM NewTickets n
       WHERE t.TicketID = n.TicketID 
       	     AND t.CustID = n.CustID 
	     AND t.AirlineID = n.AirlineID
	     AND t.FlightNum = n.FlightNum;

INSERT INTO Tickets
       SELECT TicketID, CustID, AirlineID, FlightNum, SeatNum, NULL, FALSE
       FROM NewTickets 
       WHERE TicketID NOT IN
       	     (SELECT TicketID
              FROM Tickets);
COMMIT;
