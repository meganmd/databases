package entities;

import java.sql.ResultSet;
import java.io.*;
import java.sql.*;
import java.util.*;
import oracle.jdbc.*;



public class Feedback implements Serializable{
	
	private String auction;
	private String overallRating;
	private String qualityRating;
	private String deliveryRating;
	private String comments;
	
	public String getAuction() {
		return auction;
	}

	public void setAuction(String auction) {
		this.auction = auction;
	}

	public String getOverallRating() {
		return overallRating;
	}

	public void setOverallRating(String overallRating) {
		this.overallRating = overallRating;
	}
	
	public String getQualityRating() {
		return qualityRating;
	}

	public void setQualityRating(String qualityRating) {
		this.qualityRating = qualityRating;
	}
	
	public String getDeliveryRating() {
		return deliveryRating;
	}

	public void setDeliveryRating(String deliveryRating) {
		this.deliveryRating = deliveryRating;
	}
	
	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	
	public void createFeedback(){
		try{
			ResultSet results;
			Connection con = DatabaseConnection.openDBConnection();
			PreparedStatement stmt;
			String query = "INSERT INTO auction values(?, ?, ?,?, ?, ?)";
			stmt=con.prepareStatement(query);
			stmt.setString(1, this.getAuction());
			stmt.setString(2, this.getOverallRating());
			stmt.setString(3, this.getQualityRating());
			stmt.setString(4, this.getDeliveryRating());
			stmt.setString(5, this.getComments());
			results = stmt.executeQuery();
			stmt.close();
			con.close();
		}
		catch(SQLException e){
				System.out.println("SQL issue: " + e);
			}	
		
	}
	
	public ResultSet getFeedback(String auction) throws IllegalStateException{
		try{
			ResultSet results;
			Connection con = DatabaseConnection.openDBConnection();
			PreparedStatement stmt;
			String query = "SELECT * FROM feedback WHERE auction= ?";
			stmt=con.prepareStatement(query);
			stmt.setString(1, this.getAuction());
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
                               