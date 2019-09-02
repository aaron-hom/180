import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A class that connects to PostgreSQL and disconnects.
 * You will need to change your credentials below, to match the usename and password of your account
 * in the PostgreSQL server.
 * The name of your database in the server is the same as your username.
 * You are asked to include code that tests the methods of the FlyingApplication class
 * in a similar manner to the sample RunStoresApplication.java program.
*/


public class RunFlyingApplication{
    public static void main(String[] args) {
    	Connection connection = null;
    	try {
    	    //Register the driver
    		Class.forName("org.postgresql.Driver"); 
    	    // Make the connection.
            // You will need to fill in your real username
            // and password for your Postgres account in the arguments of the
            // getConnection method below.
            connection = DriverManager.getConnection(
		         "jdbc:postgresql://cmps180-db.lt.ucsc.edu/awhom", "awhom", "Zippy1108");
            
            if (connection != null)
                System.out.println("Connected to the database!");

            /* Include your code below to test the methods of the FlyingApplication class
             * The sample code in RunStoresApplication.java should be useful.
             * That code tests other methods for a different database schema.
             * Your code below: */

        // your code here
	    FlyingApplication app = new FlyingApplication(connection); //create connection
            List<String> AirlineID = app.getAirlinesWithManyFlights(3); //run tests
	    /*
	     *Output of getAirlinesWithManyFlights
	     *when the parameter numberOfFlights is 3.
              output here
	    
	      Southwest Airlines
	      American Airlines
	      Delta Airlines
	      Virgin America
	      JetBlue Airways
	      Frontier Airlines
	      Spirit Airlines
	      United Airlines
	    */
	    int Cost = app.raiseAirlineTicketCosts("UAL", 25);
	    int totalUnpaid1 = app.deleteSomeUnpaidTickets(1);
	    int totalUnpaid2 = app.deleteSomeUnpaidTickets(2);
	    connection.close(); //close connection
           // end of your code

            /*******************
            * Your code ends here */
            
    	}
    	catch (SQLException | ClassNotFoundException e) {
    		System.out.println("Error while connecting to database: " + e);
    		e.printStackTrace();
    	}
    	finally {
    	    if (connection != null) {
    		// Closing Connection
    		try{
		    connection.close();
		}catch (SQLException e) {
		    System.out.println("Failed to close connection: " + e);
		    e.printStackTrace();
		 }
    	    }
    	}
    }
}
