package entities;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Auction {
	//Create J Unit test file for Auction and Bid
	private int itemid;
	
	private String seller;
	
	
	private String startTime;
	
	private String endTime;
	
	private String itemName;
	
	private String itemDescription;
	
	private String itemCategory;
	
	
	//Variable of type database connection
	private Connection myConnection;
	
	//Variable of type prepared statement
	private CallableStatement callStmt;  
	
	
	//Variables of type ResultSet which will contain query output
	private ResultSet result;
	
	//Setter and Getters
	public int getItemid() {
		return itemid;
	}
	
	public void setItemid(int itemid) {
		this.itemid = itemid;
	}
	
	public String getSeller() {
		return seller;
	}
	
	public void setSeller(String seller) {
		this.seller = seller;
	}
	
	public String getStartTime() {
		return startTime;
	}
	
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	
	public String getEndTime() {
		return endTime;uteQuery(sql);
		return results;
		} catch (SQLException E) {
		      E.printStackTrace();
	}
	
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	public String getItemName() {
		return itemName;
	}
	
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	public String getItemDescription() {
		return itemDescription;
	}
	
	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}
	
	public String getItemCategory() {
		return itemCategory;
	}
	
	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
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
	
	/*public ResultSet executeStatement(String sql){
		try{
		Connection con = openDBConnection();
		Statement stmt = con.createStatement();
		ResultSet results = stmt.executeQuery(sql);
		return results;
		} catch (SQLException E) {
		      E.printStackTrace();
		    }
		return null;
	}*/
	  
	public void createAuction(int itemid, String seller, String startTime, String endTime, String itemName, String itemDescription, String itemCategory){
		ResultSet results = executeStatement(sql);
	}
		//getBidderList -using items_bid_on.sql
	public void getBidderList(int itemid, String seller, String startTime, String endTime, String itemName, String itemDescription, String itemCategory){
		String sql = 
		ResultSet results = executeStatement(sql);
		
	}
		//getWinner
		
		//resultset getAuction
		
	}

}