package entitiesTest;

	import org.junit.Before;
	import org.junit.Test;
	import java.sql.ResultSet;
	import java.sql.ResultSetMetaData;
	import java.sql.SQLException;

	import org.junit.After;
	import entities.Feedback;

	public class FeedbackTest {

		Feedback feedback1;

	@Before
	public void setUp(){
	feedback1 = new Feedback();

	feedback1.setAuction("0");
	feedback1.setOverallRating("2");
	feedback1.setQualityRating("4");
	feedback1.setDeliveryRating("5");
	feedback1.setComments("This is terrriblllee");

		}


	@Test
	public void testGetFeedback() throws SQLException{
		  try{
				
				ResultSet rs = feedback1.getFeedback("0");
				
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
		feedback1 = new Feedback();

		feedback1.setAuction("0");
		feedback1.setOverallRating("2");
		feedback1.setQualityRating("4");
		feedback1.setDeliveryRating("5");
		feedback1.setComments("This is terrriblllee");
			
			}
	}

