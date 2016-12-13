<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="account" class="mmdaly.entities.Account" scope="session"/>
<jsp:setProperty name="account" property="*"/>

<%
	boolean validCredentials = account.login();
	System.out.println(account.isLoggedIn() + " " + account.getUsername() + "" + validCredentials);
	if(account.isLoggedIn() && account.isAdmin()){
		response.sendRedirect("AdminHome.jsp");
	} else if(account.isLoggedIn() && !account.isAdmin()) {
		response.sendRedirect("AccountHome.jsp");
	} else {
		System.out.println("Boo");
		response.sendRedirect("Login.jsp");
	}
%>