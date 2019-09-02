SELECT p.CustID, CustName, COUNT(CustName) AS CA_NY_Total
       FROM CA_NY_Passengers p, Customers c
       WHERE p.CustID = c.CustID
       GROUP BY p.CustID, CustName;
/* Result of Above Query
 custid |    custname    | ca_ny_total
--------+----------------+-------------
    114 | Jim Halpert    |           1
    131 | Harvey Spectre |           1
    137 | Drew Powell    |           2
    139 | Sadik Hadzovic |           2
*/

DELETE FROM Tickets
       WHERE TicketID IN (202, 204);

/* Result After Delete Statements
 custid |    custname    | ca_ny_total
--------+----------------+-------------
    114 | Jim Halpert    |           1
    137 | Drew Powell    |           1
    139 | Sadik Hadzovic |           2
*/
