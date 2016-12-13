package entitiesTest;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import org.junit.After;
import org.junit.Assert;
import entities.Account;
import entities.Feedback;
import junit.framework.TestCase;

public class AccountTest {
	Account acct;
	Account acct1;
	Account acct2;
	Account acct4;
	Account acct7;
	Feedback feedback1;


	@Before
	public void init() throws Exception {
		acct = new Account();
		acct.setUsername("santa");
		acct.setPassword("ice");
		acct.setPhone("1111111111");
		acct.setEmail("s@gmai.comS");
		acct.setFname("santa");
		acct.setLname("claus");
		acct.setAdmin(true);
		
		acct1 = new Account();
		acct1.setUsername("user2");
		acct1.setPassword("password2");
		acct1.setPhone("0123456789");
		acct1.setEmail("user2@csbsju.edu");
		acct1.setFname("user");
		acct1.setLname("two");
		acct1.setAdmin(false);
		
		acct2 = new Account();
		acct2.setUsername("harrypotter");
		acct2.setPassword("hedwig");
		acct2.setPhone("8888888888");
		acct2.setEmail("hjpotter@hogwarts.edu");
		acct2.setFname("h");
		acct2.setLname("potter");
		acct2.setAdmin(false);
		
		feedback1 = new Feedback();

		feedback1.setAuction("0");
		feedback1.setOverallRating("2");
		feedback1.setQualityRating("4");
		feedback1.setDeliveryRating("5");
		feedback1.setComments("This is terrriblllee");

		
	}
	@Test
	public void testLogin() {
		Assert.assertFalse(acct.isLoggedIn());
		acct.login();
		Assert.assertTrue(acct.isLoggedIn());
	}
	
	@Test
	public void testLoginforInvalidCreditials() {
		Assert.assertFalse(acct7.isLoggedIn());
		acct7.login();
		Assert.assertFalse(acct7.isLoggedIn());

	}
	
	@Test
	public void testCreateAccountforAccount() throws SQLException {
		try{
		Account acct3 = new Account();
		acct3.setUsername("user1");
		acct3.setPassword("password1");
		acct3.setPhone("0123456789");
		acct3.setEmail("user1@csbsju.edu");
		acct3.setFname("user");
		acct3.setLname("one");
		acct3.setAdmin(false);
		
		ResultSet rs = acct3.getAccountInfo();
		
		   ResultSetMetaData rsmd = rs.getMetaData();
		   System.out.println("Result Set Values: Create Account");
		   int columnsNumber = rsmd.getColumnCount();
		   System.out.println(columnsNumber);

		   while (rs.next()) {
		       for (int i = 1; i <= columnsNumber; i++) {
		           if (i > 1) System.out.print(",  ");
		           String columnValue = rs.getString(i);
		           System.out.print(rsmd.getColumnName(i) + ": " + columnValue);
		       }
		       System.out.println("");
		   }
		   
}
	catch(IllegalArgumentException iae){
		iae.printStackTrace();}
		
	}

	@Test
	public void testGetAccountInfo() throws SQLException{ 
		  try{
			  System.out.println("");
			  System.out.println("");
			  System.out.println("Testing Get Account Info:");
				System.out.println(acct.getUsername());
				System.out.println(acct.getPassword());
				System.out.println(acct.getPhone());
				System.out.println(acct.getEmail());
				System.out.println(acct.getFname());
				System.out.println(acct.getLname());
				System.out.println(acct.isAdmin());
				
				ResultSet rs = acct.getAccountInfo();
				
				   ResultSetMetaData rsmd = rs.getMetaData();
				   System.out.println("Result Set Values: Get Account Info");
				   int columnsNumber = rsmd.getColumnCount();
				   System.out.println(columnsNumber);

				   while (rs.next()) {
				       for (int i = 1; i <= columnsNumber; i++) {
				           if (i > 1) System.out.print(",  ");
				           String columnValue = rs.getString(i);
				           System.out.print(rsmd.getColumnName(i) + ": " + columnValue);
				       }
				       System.out.println("");
				   }
		  	} 
		  catch(IllegalArgumentException iae){
		    iae.printStackTrace();
		   }
	}
	
	@Test
	public void testUpdateAccountInfo() throws SQLException{ 
		  try{
			  System.out.println("");
			  System.out.println("");
			  System.out.println("Testing Update Account Info:");
				acct1.setUsername("user01");
				acct1.setPassword("password01");
				acct1.setPhone("0123456789");
				acct1.setEmail("user01@csbsju.edu");
				acct1.setFname("User");
				acct1.setLname("One");
				acct1.setAdmin(false);
				
				acct1.updateAccount();
				
				System.out.println(acct1.getUsername());
				System.out.println(acct1.getPassword());
				System.out.println(acct1.getPhone());
				System.out.println(acct1.getEmail());
				System.out.println(acct1.getFname());
				System.out.println(acct1.getLname());
				System.out.println(acct1.isAdmin());
	}
		  catch(IllegalArgumentException iae){
			    iae.printStackTrace();
			   }
	}
	
	@Test
	public void testDeleteAccount() throws SQLException{ 
		  try{
			  System.out.println("");
			  System.out.println("");
			  System.out.println("Testing Delete Account Info:");
				acct1.deleteAccount();
			
				ResultSet rs = acct.getUserList();
				
				   ResultSetMetaData rsmd = rs.getMetaData();
				   System.out.println("Result Set Values: Get Account Info");
				   int columnsNumber = rsmd.getColumnCount();
				   System.out.println(columnsNumber);

				   while (rs.next()) {
				       for (int i = 1; i <= columnsNumber; i++) {
				           if (i > 1) System.out.print(",  ");
				           String columnValue = rs.getString(i);
				           System.out.print(rsmd.getColumnName(i) + ": " + columnValue);
				       }
				       System.out.println("");
				   }
		  	} 
		  
		  catch(IllegalArgumentException iae){
		    iae.printStackTrace();
		  }
		  
	}
		  
		  public void testGetUserList() throws SQLException{ 
			  try{
				  
				  System.out.println("");
				  System.out.println("");
				  System.out.println("Testing Get User List:");
				    
					Account acct4 = new Account();
					acct4.setUsername("newuser");
					acct4.setPassword("newpassword");
					acct4.setPhone("0123456789");
					acct4.setEmail("newuser@csbsju.edu");
					acct4.setFname("new");
					acct4.setLname("user");
					acct4.setAdmin(false);
					
				
					ResultSet rs = acct.getUserList();
					
					   ResultSetMetaData rsmd = rs.getMetaData();
					   System.out.println("Result Set Values: Get Account Info");
					   int columnsNumber = rsmd.getColumnCount();
					   System.out.println(columnsNumber);

					   while (rs.next()) {
					       for (int i = 1; i <= columnsNumber; i++) {
					           if (i > 1) System.out.print(",  ");
					           String columnValue = rs.getString(i);
					           System.out.print(rsmd.getColumnName(i) + ": " + columnValue);
					       }
					       System.out.println("");
					   }
			  	} 
			  
			  catch(IllegalArgumentException iae){
			    iae.printStackTrace();
			   }
	}
		  
		  
		  
		  public void testItemsBidOn() throws SQLException{ 
			  try{
				  System.out.println("");
				  System.out.println("");
				  System.out.println("Testing Items Bid On:");
				   
				
					ResultSet rs = acct.itemsBidOn();
					
					   ResultSetMetaData rsmd = rs.getMetaData();
					   System.out.println("Result Set Values: Get Account Info");
					   int columnsNumber = rsmd.getColumnCount();
					   System.out.println(columnsNumber);

					   while (rs.next()) {
					       for (int i = 1; i <= columnsNumber; i++) {
					           if (i > 1) System.out.print(",  ");
					           String columnValue = rs.getString(i);
					           System.out.print(rsmd.getColumnName(i) + ": " + columnValue);
					       }
					       System.out.println("");
					   }
			  	} 
			  
			  catch(IllegalArgumentException iae){
			    iae.printStackTrace();
			  }}
		  
			    @Test
				public void testGetFeedback() throws SQLException{
					  try{
						   System.out.println("");
						   System.out.println("");
						   
						   System.out.println("Get Feedback: ");

						   System.out.println(feedback1.getAuction());
						   System.out.println(feedback1.getOverallRating());
						   System.out.println(feedback1.getQualityRating());
						   System.out.println(feedback1.getDeliveryRating());
						   System.out.println(feedback1.getComments());
					  }
					  
				catch(IllegalArgumentException iae){
					    iae.printStackTrace();
					   }
				}
			
			@After
			public void tearDown(){
				acct.setUsername("santa");
				acct.setPassword("ice");
				acct.setPhone("1111111111");
				acct.setEmail("s@gmai.comS");
				acct.setFname("santa");
				acct.setLname("claus");
				acct.setAdmin(true);
				
				acct1 = new Account();
				acct1.setUsername("user2");
				acct1.setPassword("password2");
				acct1.setPhone("0123456789");
				acct1.setEmail("user2@csbsju.edu");
				acct1.setFname("user");
				acct1.setLname("two");
				acct1.setAdmin(false);
				
				acct2 = new Account();
				acct2.setUsername("harrypotter");
				acct2.setPassword("hedwig");
				acct2.setPhone("8888888888");
				acct2.setEmail("hjpotter@hogwarts.edu");
				acct2.setFname("h");
				acct2.setLname("potter");
				acct2.setAdmin(false);

					
					}

	}
