<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="bid" class="mmdaly.entities.Bid" scope="page"/> 
<jsp:setProperty name="bid" property="*"/>
<jsp:useBean id="account" class="mmdaly.entities.Account" scope="session"/>

<%
	bid.setCustomer(account.getUsername());
	try {
	bid.createBid();
	} catch (Exception e) {
		e.printStackTrace();
	}
	response.sendRedirect("Search.jsp"); //should be to search results...
%>