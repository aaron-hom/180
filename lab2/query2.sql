SELECT CustName
FROM Customers c, Tickets t
WHERE c.CustID = t.CustID AND CustName LIKE 'W%' AND t.AirlineID = 'UAL'
ORDER BY CustName ASC;


