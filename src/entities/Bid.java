import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Bid {
	
	//Create J Unit test file for Auction and Bid

	private static int auctionid;

	private static String customer;

	private static String time;

	private static int maximumBidLimit;

	public static int getAuctionid() {
		return auctionid;
	}

	public static void setAuctionid(int auctionid) {
		Bid.auctionid = auctionid;
	}

	public static String getCustomer() {
		return customer;
	}

	public static void setCustomer(String customer) {
		Bid.customer = customer;
	}

	public static String getTime() {
		return time;
	}

	public static void setTime(String time) {
		Bid.time = time;
	}

	public static int getMaximumBidLimit() {
		return maximumBidLimit;
	}

	public static void setMaximumBidLimit(int maximumBidLimit) {
		Bid.maximumBidLimit = maximumBidLimit;
	}
	
	
	public Connection openDBConnection() {
	    try {
	      // Load driver and link to driver manager
	      Class.forName("oracle.jdbc.OracleDriver");
	      // Create a connection to the specified database
	      Connection myConnection = DriverManager.getConnection("jdbc:oracle:thin:@//cscioraclesrv.ad.csbsju.edu:1521/" +
	                                                            "csci.cscioraclesrv.ad.csbsju.edu","team4", "Pds3D");
	      return myConnection;
	    } catch (Exception E) {
	      E.printStackTrace();
	    }
	    return null;
	  }

	public ResultSet executeStatement(String sql){
		try{
		Connection con = openDBConnection();
		Statement stmt = con.createStatement();
		ResultSet results = stmt.executeQuery(sql);
		return results;
		} catch (SQLException E) {
		      E.printStackTrace();
		    }
		return null;
	}
	
	//Create 
	public void createBid(int auctionid, String customer, String time, int maximumBidLimit){
		ResultSet results = executeStatement(sql);
	}
	
	//getBidInfo
}