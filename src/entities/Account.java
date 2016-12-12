package entities;

import java.io.*;
import java.sql.*;
import java.util.*;
import oracle.jdbc.*;

public class Account implements Serializable {
	
	private String username;
	private String password;
	private boolean isAdmin;
	private String phone;
	private String email;
	private String fname;
	private String lname;
	private boolean isLoggedIn;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}
	public Boolean isLoggedIn() {
		return isLoggedIn;
	}

	public void isLoggedIn(boolean isLoggedIn) {
		this.isLoggedIn=false;
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
		Connection con = openDBConnection();
		Statement stmt = con.createStatement();
		ResultSet results = stmt.executeQuery(sql);
		return results;
		} catch (SQLException E) {
		      E.printStackTrace();
		    }
		return null;
		
	}
	*/
	public boolean login(){
		try{
			ResultSet results;
			Connection con = DatabaseConnection.openDBConnection();
			PreparedStatement stmt;
			String query = "SELECT * FROM ACCOUNT WHERE username like ? AND password like ?";
			stmt=con.prepareStatement(query);
			stmt.setString(1, username);
			stmt.setString(2, password);
			results = stmt.executeQuery();
			
			if(results.next()){
				this.isLoggedIn=true;
				this.email = results.getString("email");
				this.fname = results.getString("fname");
				this.lname = results.getString("lname");
				this.isAdmin = results.getBoolean("is_admin");
				this.phone = results.getString("phone");
			}
			else{
				this.isLoggedIn=false;
			}
			return this.isLoggedIn;
		}
		catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
	public void createAccount(){
		try{
			ResultSet results;
			Connection con = DatabaseConnection.openDBConnection();
			PreparedStatement stmt;
			String query = "INSERT INTO account values(?, ?, ?,?, ?, ?)";
			stmt=con.prepareStatement(query);
			stmt.setString(1, this.getUsername());
			stmt.setString(2, this.getPassword());
			stmt.setBoolean(3, this.isAdmin());
			stmt.setString(4, this.getPhone());
			stmt.setString(5, this.getEmail());
			stmt.setString(6, this.getFname());
			stmt.setString(7, this.getLname());
			stmt.setString(2, this.getPassword());
			results = stmt.executeQuery();
			stmt.close();
			con.close();
		}
		catch(SQLException e){
				System.out.println("SQL issue: " + e);
			}	
		
	}
	
	public ResultSet getAccountInfo() throws IllegalStateException{
		try{
			ResultSet results;
			Connection con = DatabaseConnection.openDBConnection();
			PreparedStatement stmt;
			String query = "SELECT * FROM account WHERE username= ?";
			stmt=con.prepareStatement(query);
			stmt.setString(1, this.getUsername());
			results = stmt.executeQuery();
			stmt.close();
			
			return results;
		}
		catch(SQLException e){
				System.out.println("SQL issue: " + e);
			}	
		return null;
		
		
	}
	
	public void updateAccount(){
		
			ResultSet results = null;
			Connection con = DatabaseConnection.openDBConnection();
			PreparedStatement stmt;
			String query = "UPDATE ACCOUNT SET PASSWORD = ?, PHONE = ?, EMAIL = ?, FNAME = ?, LNAME = ? WHERE username like ?";
		try{
			stmt=con.prepareStatement(query);
			stmt.setString(1, this.getPassword());
			stmt.setString(2, this.getPhone());
			stmt.setString(3, this.getEmail());
			stmt.setString(4, this.getFname());
			stmt.setString(5, this.getLname());
			stmt.setString(6, this.getUsername());
			results = stmt.executeQuery();
			stmt.close();
			con.close();
		}
		catch(SQLException e){
				System.out.println("SQL issue: " + e);
			}	
	}
	
	public void deleteAccount(){
		try{
			ResultSet results;
			Connection con = DatabaseConnection.openDBConnection();
			PreparedStatement stmt;
			String query = "DELETE from account WHERE username= ?";
			stmt=con.prepareStatement(query);
			stmt.setString(1, this.getUsername());
			results = stmt.executeQuery();
			stmt.close();
			con.close();
		}
		catch(SQLException e){
				System.out.println("SQL issue: " + e);
			}	
	}
	
	
	//public ResultSet auctionsWon(String username) throws IllegalStateException{
		//return null;
	//}
	
	//public ResultSet userBids(String username) throws IllegalStateException{
		//return null;
	//}
	
	public ResultSet getUserList()throws IllegalStateException{
		try{
			ResultSet results;
			Connection con = DatabaseConnection.openDBConnection();
			PreparedStatement stmt;
			String query = "SELECT * FROM Account";
			stmt=con.prepareStatement(query);
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
	
	
	//public void giveFeedback(String auction, String overallRating, String qualityRating, String deliveryRating, String comments ){
	//}
	
	public ResultSet salesSummaryReport() throws IllegalStateException{
		return null;
	}
	
	public ResultSet overallCommissionReport() throws IllegalStateException{
		return null;
	}

}