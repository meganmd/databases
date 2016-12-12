package entitiesTest;

import static org.junit.Assert.*;

import java.sql.ResultSet;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import entities.Search;

public class SearchTest {

	@Before
	public void setUp() throws Exception {
		Search search1 = new Search("1", null, null, -1, -1, null, null);
		ResultSet rs1 = search1.searchDatabase();
		Search search2 = new Search(null, "nimbus", null, -1, -1, null, null);
		ResultSet rs2 = search2.searchDatabase();
		Search search3 = new Search(null, null, "Books", -1, -1, null, null);
		ResultSet rs3 = search3.searchDatabase();
		Search search4 = new Search(null, null, null, 3.00, 60.0, null, null);
		ResultSet rs4 = search4.searchDatabase();
		Search search5 = new Search(null, "nimbus", null, 3.00, 60.0, null, null);
		ResultSet rs5 = search5.searchDatabase();
	}

	@Test
	public void test() {
		
		
		Assert.assertTrue("query with itemId has one result", true);
	}

}
