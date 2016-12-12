<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="account" class="entities.Account" scope="session"/>
<jsp:setProperty name="account" property="*"/>

<%
	boolean validCredentials = account.login();
	System.out.println(account.isLoggedIn() + " " + account.getUsername() + "" + validCredentials);
	if(validCredentials == true){
		response.sendRedirect("AccountHome.html");
		}
	else {
		System.out.println("Boo");
		response.sendRedirect("Login.jsp");
		}
%>