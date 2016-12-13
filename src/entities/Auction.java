package entities;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Auction {
	//Create J Unit test file for Auction and Bid
	private int itemId = -1;
	
	private String sellerId;
	
	
	private String startTime;
	
	private String endTime;
	
	private String itemName;
	
	private String itemDescription;
	
	private String itemCategory;
	
	private double startingPrice = -1;
	
	private double currentBid = -1;

	
	public double getCurrentBid() {
		return currentBid;
	}

	public void setCurrentBid(double currentBid) {
		this.currentBid = currentBid;
	}

	public double getStartingPrice() {
		return startingPrice;
	}

	public void setStartingPrice(double startingPrice) {
		this.startingPrice = startingPrice;
	}

	
	
	//Variable of type database connection
	private Connection myConnection;
	
	//Variable of type prepared statement
	private CallableStatement callStmt;  
	
	
	//Variables of type ResultSet which will contain query output
	private ResultSet result;
	
	//Setter and Getters
	public int getItemid() {
		return itemId;
	}
	
	public void setItemid(int itemid) {
		this.itemId = itemid;
	}
	
	public String getSeller() {
		return sellerId;
	}
	
	public void setSeller(String seller) {
		this.sellerId = seller;
	}
	
	public String getStartTime() {
		return startTime;
	}
	
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	
	public String getEndTime() {
	//	return endTime;uteQuery(sql);
	//	return results;
	//	} catch (SQLException E) {
	//	      E.printStackTrace();
		return null;
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
	  
	public void createAuction(){
		try{
//should be generating itemid not letting user input
			ResultSet results;
			Connection con = DatabaseConnection.openDBConnection();
			PreparedStatement stmt;
			String query = "INSERT INTO auction values(?,?,?,?,?,?,?,?)";
			stmt=con.prepareStatement(query);
			stmt.setInt(1, this.getItemid());
			stmt.setString(2, this.getSeller());
			stmt.setString(3, this.getStartTime());
			stmt.setString(4, this.getEndTime());
			stmt.setString(5, this.getItemName());
			stmt.setString(6, this.getItemDescription());
			stmt.setString(7, this.getItemCategory());
			results = stmt.executeQuery();
			stmt.close();
			con.close();
		}
		catch(SQLException e){
			e.printStackTrace();
		}	
	}
		//getBidderList -using items_bid_on.sql
	public ResultSet getAuctionInfo() throws IllegalStateException{
		try{
			ResultSet results;
			Connection con = DatabaseConnection.openDBConnection();
			PreparedStatement stmt;
			String query = "SELECT * FROM Auction where item_id= ?";
			stmt=con.prepareStatement(query);
			stmt.setInt(1, this.getItemid());
			results = stmt.executeQuery();
			//stmt.close();
			//con.close();
			
			return results;	
			
		}
		catch(SQLException e){
			e.printStackTrace();
		}	
		return null;
	}
	public void populateAuctionInfo() {
		try{
			ResultSet results;
			Connection con = DatabaseConnection.openDBConnection();
			PreparedStatement stmt;
			String query = "SELECT * FROM expanded_auction where item_id= ?";
			stmt=con.prepareStatement(query);
			stmt.setInt(1, itemId);
			results = stmt.executeQuery();
			if(results.next()) {
				itemCategory = results.getString("item_category");
				startTime = results.getString("start_time");
				endTime = results.getString("end_time");
				itemDescription = results.getString("item_description");
				itemName = results.getString("item_name");
				sellerId = results.getString("seller");
				startingPrice = results.getDouble("starting_price");
				currentBid = results.getString("current_bid") != null ? Double.parseDouble(results.getString("current_bid")) : -1;
			} else {
				throw new IllegalStateException("must specify valid auction id");
			}
			stmt.close();
			con.close();
		} catch(SQLException e){
			e.printStackTrace();
		}	
	}
	
	public ResultSet getBidderList() throws IllegalStateException{
		try{
			ResultSet results;
			Connection con = DatabaseConnection.openDBConnection();
			PreparedStatement stmt;
			String query = "SELECT b.CUSOTMER, b.BID_TIME, b.MAXIMUM_BID_LIMIT, ea.WINNER FROM BID b, EXPANDED_AUCTION ea where auctionId= ?";
			stmt=con.prepareStatement(query);
			stmt.setInt(1, this.getItemid());
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