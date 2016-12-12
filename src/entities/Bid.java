package entities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.io.Serializable;

public class Bid implements Serializable{
	
	//Create J Unit test file for Auction and Bid

	private int auctionid;

	private String customer;

	private String time;

	private double maximumBidLimit;

	public int getAuctionid() {
		return auctionid;
	}

	public void setAuctionid(int auctionid) {
		this.auctionid = auctionid;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public double getMaximumBidLimit() {
		return maximumBidLimit;
	}

	public void setMaximumBidLimit(int maximumBidLimit) {
		this.maximumBidLimit = maximumBidLimit;
	}
	
	//replaced with DatabaseConnection.openDBConnection()
	/*public Connection openDBConnection() {
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
	  }*/

/*	public ResultSet executeStatement(String sql){
		try{
		Connection con = DatabaseConnection.openDBConnection();
		Statement stmt = con.createStatement();
		ResultSet results = stmt.executeQuery(sql);
		return results;
		} catch (SQLException E) {
		      E.printStackTrace();
		    }
		return null;
	}
	*/
	
	//Create 
	public void createBid(){
		try{
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			time = timestamp.toString();
			Connection con = DatabaseConnection.openDBConnection();
			PreparedStatement stmt;
			String sql = "INSERT INTO BID values(?, ?, ?) WHERE auctionid like ?";
			stmt=con.prepareStatement(sql);
			stmt.setString(1, this.getCustomer());
			stmt.setString(2, this.getTime());
			stmt.setDouble(3, getMaximumBidLimit());
			stmt.setInt(4, getAuctionid());
			stmt.execute();
			stmt.close();
			con.close();
		}
		catch(SQLException e){
				e.printStackTrace();
			}	
	}
	
	//getBidInfo
	public ResultSet getBidInfo(){
		try{
			ResultSet results;
			Connection con = DatabaseConnection.openDBConnection();
			PreparedStatement stmt;
			String query = "SELECT * FROM bid WHERE auctionId= ?";
			stmt=con.prepareStatement(query);
			stmt.setInt(1, auctionid);
			results = stmt.executeQuery();
			stmt.close();
			con.close();
			
			return results;
		}
		catch(SQLException e){
			e.printStackTrace();
		}	
		return null;
	}
}