ALTER TABLE Tickets
ADD CONSTRAINT postive_cost
CHECK (Cost > 0);

ALTER TABLE Flights
ADD CONSTRAINT flights_take_time
CHECK (ArrivalTime > DepartureTime);

ALTER TABLE Airports
ADD CONSTRAINT knox_tn
CHECK (State <> 'TN' AND City <> 'Knoxville'
      OR State = 'TN' AND City = 'Knoxville');

ALTER TABLE Flights
ADD CONSTRAINT origin_not_destination
CHECK (Origin <> Destination);
