package mmdaly.entitiesTest;

import org.junit.Before;
import org.junit.Test;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import org.junit.After;
import mmdaly.entities.Bid;

public class BidTest {

	Bid bid1;

@Before
public void setUp(){
bid1 = new Bid();

bid1.setCustomer("user3");
bid1.setTime("2016-12-02"); 
bid1.setMaximumBidLimit(90);
bid1.setAuctionid(0);

	}



@Test
public void testGetBidInfo() throws SQLException{ 
	  try{
		    System.out.println("Testing Get Auction Info:");
			System.out.println(bid1.getCustomer());
			System.out.println(bid1.getTime());
			System.out.println(bid1.getMaximumBidLimit());
			System.out.println(bid1.getAuctionid());

			ResultSet rs = bid1.getBidInfo();
			
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



@After
public void tearDown(){
		
		}
}