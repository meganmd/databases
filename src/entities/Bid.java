package entities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.io.Serializable;

public class Bid implements Serializable{
	
	//Create J Unit test file for Auction and Bid

	private int auctionid;

	private String customer;

	private String time;

	private int maximumBidLimit;

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

	public int getMaximumBidLimit() {
		return maximumBidLimit;
	}

	public void setMaximumBidLimit(int maximumBidLimit) {
		this.maximumBidLimit = maximumBidLimit;
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
		try{
			ResultSet results;
			Connection con = openDBConnection();
			PreparedStatement stmt;
			String query = "INSERT INTO BID values(?, ?, ?) WHERE auctionid like ?";
			stmt=con.prepareStatement(query);
			stmt.setString(1, customer);
			stmt.setString(2, time);
			stmt.setInt(3, maximumBidLimit);
			stmt.setInt(4, auctionid);
			results = stmt.executeQuery();
			stmt.close();
			con.close();
		}
		catch(SQLException e){
				System.out.println("SQL issue: " + e);
			}	
	}
	
	//getBidInfo
	public ResultSet getBidInfo(int auctionid, String customer, String time, int maximumBidLimit){
		try{
			ResultSet results;
			Connection con = openDBConnection();
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
				System.out.println("SQL issue: " + e);
			}	
		return null;
	}
}