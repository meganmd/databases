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
	

	public void createFeedback(String auction, String overallRating, String qualityRating, String deliveryRating, String comments){
		try{
			ResultSet results;
			Connection con = openDBConnection();
			PreparedStatement stmt;
			String query = "INSERT INTO auction values(?, ?, ?,?, ?, ?)";
			stmt=con.prepareStatement(query);
			stmt.setString(1, auction);
			stmt.setString(2, overallRating);
			stmt.setBoolean(3, qualityRating);
			stmt.setString(4, deliveryRating);
			stmt.setString(5, comments);
			results = stmt.executeQuery();
			stmt.close();
			con.close();
		}
		catch(SQLException e){
				System.out.println("SQL issue: " + e);
			}	
		
	}
	
	public ResultSet getFeedback(String username) throws IllegalStateException{
		try{
			ResultSet results;
			Connection con = openDBConnection();
			PreparedStatement stmt;
			String query = "SELECT * FROM feedback WHERE auction= ?";
			stmt=con.prepareStatement(query);
			stmt.setString(1, auction);
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
