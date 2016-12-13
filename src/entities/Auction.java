package entities;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Auction {
	//Create J Unit test file for Auction and Bid
	private int itemId = -1;
	
	private String sellerId;
	
	private Timestamp startTime;
	
	private Timestamp endTime;
	
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
		return startTime.toString();
	}
	
	public void setStartTime(String startTime) {
		try {
			Date sd = new SimpleDateFormat("yyyy-MM-dd").parse(startTime);
			this.startTime = new Timestamp(sd.getTime());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getEndTime() {
		return endTime.toString();
	}
	
	public void setEndTime(String endTime) {
		try {
			Date sd = new SimpleDateFormat("yyyy-MM-dd").parse(endTime);
			this.endTime = new Timestamp(sd.getTime());
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	  
	public void createAuction(){
		try{
			this.itemId = generateItemId();
			ResultSet results;
			Connection con = DatabaseConnection.openDBConnection();
			PreparedStatement stmt;
			String query = "INSERT INTO auction values(?,?,?,?,?,?,?,?)";
			stmt=con.prepareStatement(query);
			stmt.setInt(1, this.getItemid());
			stmt.setString(2, this.getSeller());
			stmt.setTimestamp(3, this.startTime);
			stmt.setTimestamp(4, this.endTime);
			stmt.setDouble(5, startingPrice);
			stmt.setString(6, this.getItemName());
			stmt.setString(7, this.getItemDescription());
			stmt.setString(8, this.getItemCategory());
			results = stmt.executeQuery();
			stmt.close();
			con.close();
		}
		catch(SQLException e){
			e.printStackTrace();
		}	
	}
	
	private int generateItemId(){
		try {
			Connection con = DatabaseConnection.openDBConnection();
			String sql = "Select max(item_id) as last_id from auction";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery(sql);
			int next = 0;
		if(rs.next()) {
			next = rs.getInt("last_id") + 1;
		}
		return next;
		} catch(SQLException e) {
			e.printStackTrace();
			return 0;
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
				startTime = results.getTimestamp("start_time");
				endTime = results.getTimestamp("end_time");
				itemDescription = results.getString("item_description");
				itemName = results.getString("item_name");
				sellerId = results.getString("seller");
				startingPrice = results.getDouble("starting_price");
				currentBid = results.getString("current_bid") != null ? results.getDouble("current_bid") : results.getDouble("starting_price");
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
			String query = "SELECT CUSTOMER, BID_TIME, MAXIMUM_BID_LIMIT, WINNER " +
					"FROM BID join EXPANDED_AUCTION on BID.AUCTION_ID = EXPANDED_AUCTION.ITEM_ID " +
					"WHERE AUCTION_ID = ?";
			stmt=con.prepareStatement(query);
			stmt.setInt(1, this.getItemid());
			results = stmt.executeQuery();
			
			return results;	
			
		}
		catch(SQLException e){
			e.printStackTrace();
		}	
		return null;
		
	}
		
}