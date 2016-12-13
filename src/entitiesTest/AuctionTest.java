package entitiesTest;

import org.junit.Before;
import org.junit.Test;
import java.sql.Timestamp;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import org.junit.After;
import org.junit.Assert;
import entities.Auction;
import junit.framework.TestCase;

public class AuctionTest {

	Auction auction1,
			auction2;

@Before
public void setUp(){
auction1 = new Auction();

auction2 = new Auction();

auction1.setItemid(0);
auction1.populateAuctionInfo();
/*auction1.setSeller("harrypotter");
auction1.setStartTime(timestamp);//FIX
auction1.setItemName("Broomstick");//FIX
auction1.setItemDescription("Nimbus 2001 for sale!!!!");
auction1.setItemCategory("Vehicles");
*/

auction2.setItemid(1);
auction2.populateAuctionInfo();
/*auction1.setSeller("hermioneG");
auction1.setStartTime(timestamp);//FIX
auction1.setItemName("Fantastic Beasts and Where to Find Them");//FIX
auction1.setItemDescription("Newt Scamanders classic reference book!");
auction1.setItemCategory("Books");
*/
	}



@Test
public void testGetAuctionInfo() throws SQLException{ 
	  try{
		    System.out.println("Testing Get Auction Info:");
			System.out.println(auction1.getItemid());
			System.out.println(auction1.getSeller());
			System.out.println(auction1.getStartTime());
			System.out.println(auction1.getItemName());
			System.out.println(auction1.getItemDescription());
			System.out.println(auction1.getItemCategory());
			
			ResultSet rs = auction1.getAuctionInfo();
			
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
public void testGetBidderList() throws SQLException{
	  try{
			
			ResultSet rs = auction1.getBidderList();
			
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
	  } catch(IllegalArgumentException iae){
	    iae.printStackTrace();
	  }
	}







@After
public void tearDown(){
	auction1 = new Auction();

	auction2 = new Auction();

	auction1.setItemid(0);
	auction1.setSeller("harrypotter");
	//auction1.setStartTime();//FIX
	auction1.setItemName("Broomstick");//FIX
	auction1.setItemDescription("Nimbus 2001 for sale!!!!");
	auction1.setItemCategory("Vehicles");

	auction1.setItemid(1);
	auction1.setSeller("hermioneG");
	//auction1.setStartTime();//FIX
	auction1.setItemName("Fantastic Beasts and Where to Find Them");//FIX
	auction1.setItemDescription("Newt Scamanders classic reference book!");
	auction1.setItemCategory("Books");
	}
}
