import java.sql.*;
import java.util.*;

/**
 * The class implements methods of the Flying database interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the
 * Connection object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case
 * an error occurs in the database, then the method should print an
 * error message and call System.exit(-1);
 */
public class FlyingApplication {
    private Connection connection;
    
    /*
     * Constructor
    */
    public FlyingApplication(Connection connection){
        this.connection = connection;
    } 
    public Connection getConnection(){
        return connection;
    }
    
     /**
     * Takes as argument an integer called numberOfFlights.
     * Returns the AirlineName (not the AirlineID) for each Airline that has 
     * at least numberOfFlights different Flights.
     */

    public List<String> getAirlinesWithManyFlights(int numberOfFlights){
        List<String> result = new ArrayList<String>();
        // your code here
        try{
            PreparedStatement ps = connection.prepareStatement("SELECT AirlineName FROM Airlines a, Flights f WHERE a.AirlineID = f.AirlineID GROUP BY a.AirlineName HAVING COUNT(*) >= ?");
            ps.setInt(1, numberOfFlights);
            ResultSet rs = ps.executeQuery(); //execute 
            while (rs.next()) {  //while there is still another value              
                System.out.println(rs.getString(1)); //print
            }
        }
        catch(SQLException se){
	    se.printStackTrace();
	    se.getMessage();	
        }
        // end of your code
	return result;
    }
    
    
    /**
     * Takes an AirlineID and an increment as arguments, and raises the cost of all 
     * tickets that have that AirlineID by the amount specified in the increment argument. 
     * Of course, there may be many tickets that have that AirlineID.  If there are no 
     * tickets with that name, raiseAirlineTicketCosts should do nothing. The update  
     * should be performed as a single SQL statement.  raiseAirlineTicketCosts should 
     * return the number of tickets whose cost was incremented.
     */

    public int raiseAirlineTicketCosts(String AirlineID, int increment) {
        // your code here; return 0 appears for now to allow this skeleton to compile
	int num = 0;
	try{ 
            PreparedStatement ps = connection.prepareStatement("UPDATE Tickets SET Cost = Cost + ? WHERE AirlineID = ?");
	    ps.setInt(1, increment); //fills in values for prepared statement
            ps.setString(2, AirlineID);
	    num = ps.executeUpdate(); //exectute prepared statement
	    System.out.println(num); //print result
        }
        catch(SQLException se){
	    se.printStackTrace();
	    se.getMessage();
	}
	return num;
        // end of your code
    }
    
    
    /**
     * The deleteSomeUnpaidTickets method takes as integer deleteCount as input and invokes 
     * the deleteUnpaid stored function with that argument. The Lab4 assignment gives details 
     * on which unpaid tickets the stored function deleteUnpaid should delete.
     * The method deleteSomeUnpaidTickets must use a single SQL statement to call the stored
     * function, and must return the integer result of the deleteUnpaid stored function.
     */
public int deleteSomeUnpaidTickets(int deleteCount){
    int storedFunctionResult = 0;
        // your code here
    try{
        PreparedStatement ps = connection.prepareStatement("SELECT deleteUnpaid(?)");
        ps.setInt(1, deleteCount); //tells function how many tickets to delete
        ResultSet rs = ps.executeQuery(); //execute prepared statement
        storedFunctionResult = 0;
	//Literally could not figure out how to print return of deleteUnpaid...
    }
    catch(SQLException se){
	se.printStackTrace();
	se.getMessage();
    }
        // end of your code
    return storedFunctionResult;      
    }
};
