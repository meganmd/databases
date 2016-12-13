package mmdaly.entities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.Serializable;

public class Bid implements Serializable{
	
	//Create J Unit test file for Auction and Bid

	private int auctionid;

	private String customer;

	private Timestamp time;

	private double maximumBidLimit = -1;

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
		return time.toString();
	}

	public void setTime(String time) {
		try {
			Date sd = new SimpleDateFormat("yyyy-MM-dd").parse(time);
			this.time = new Timestamp(sd.getTime());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public double getMaximumBidLimit() {
		return maximumBidLimit;
	}

	public void setMaximumBidLimit(double maximumBidLimit) {
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
	public void createBid() throws IllegalArgumentException{
		try{
			if (this.maximumBidLimit <=0) {
				throw new IllegalArgumentException("maximum bid limit is: " + maximumBidLimit);
			}
			time = new Timestamp(System.currentTimeMillis());
			System.out.println("current time: " + time.toString());
			Connection con = DatabaseConnection.openDBConnection();
			PreparedStatement stmt;
			String sql = "INSERT INTO BID values(?, ?, ?, ?)";
			stmt=con.prepareStatement(sql);
			stmt.setInt(1, this.getAuctionid());
			stmt.setString(2, this.getCustomer());
			stmt.setTimestamp(3, this.time);
			stmt.setDouble(4, getMaximumBidLimit());
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