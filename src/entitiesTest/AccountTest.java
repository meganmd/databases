package entitiesTest;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import entities.Account;

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
