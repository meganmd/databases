package mmdaly.entitiesTest;

import static org.junit.Assert.*;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import mmdaly.entities.Account;

public class AccountTest {
	Account acct;
	Account admin;
	Account user;
	
	@Before
	public void init() throws Exception {
		acct = new Account();
		acct.setUsername("ekstensrud");
		acct.setLname("Stensrud");
		
		admin = new Account();
		admin.setUsername("admin");
		admin.setPassword("super");
		
		user = new Account();
		user.setUsername("user1");
		user.setPassword("password1");
	}
	@Test
	public void testLogin() {
		Assert.assertTrue("admin can login", admin.login());
		Assert.assertTrue("user can log in", user.login());
		
		Assert.assertTrue("admin shows as admin", admin.isAdmin());
		Assert.assertTrue("user is not admin", !user.isAdmin());
	}

}
