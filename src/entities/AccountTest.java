package entities;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class AccountTest {
	Account acct;
	
	@Before
	public void init() throws Exception {
		acct = new Account();
		acct.setUsername("ekstensrud");
		acct.setLname("Stensrud");
	}
	@Test
	public void testLogin() throws Exception {
		
	}

}
