package entities;

import java.io.*;
import java.sql.*;
import java.util.*;
import oracle.jdbc.*;

public class Account {
	
	private String username;
	private String password;
	private boolean isAdmin;
	private String phone;
	private String email;
	private String fname;
	private String lname;
	
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
	
	public void createAccount(String username, String password, Boolean isAdmin, String phone, String email, String fname, String lname){
		String sql = "INSERT INTO account values('RonW', 'oops', '333333333', 'rbweasley@hogwarts.edu', 'Ronald', 'Weasley'";
		ResultSet results = executeStatement(sql);
		
	}
	
	public ResultSet getAccountInfo(String username) throws IllegalStateException{
		String sql = "SELECT * FROM account WHERE username= " +username;
		ResultSet results = executeStatement(sql);
		return results;
	}
	
	public void updateAccount(String username, String password, Boolean isAdmin, String phone, String email, String fname, String lname){
		
	}
	
	public void deleteAccount(String username){
		String sql = "DELETE from account WHERE username="+username;
		ResultSet results = executeStatement(sql);
	}
	
	public ResultSet auctionsWon(String username) throws IllegalStateException{
		return null;
	}
	
	public ResultSet userBids(String username) throws IllegalStateException{
		return null;
	}
	
	public ResultSet getUserList()throws IllegalStateException{
		String sql = "SELECT * FROM Account";
		ResultSet results = executeStatement(sql);
		return results;
	}
	
	
	
	public void giveFeedback(String auction, String overallRating, String qualityRating, String deliveryRating, String comments ){
	}
	
	public ResultSet salesSummaryReport() throws IllegalStateException{
		return null;
	}
	
	public ResultSet overalCommissionReport() throws IllegalStateException{
		return null;
	}

}