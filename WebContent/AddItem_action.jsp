<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="auction" class="mmdaly.entities.Auction" scope="page"/>
<jsp:useBean id="account" class="mmdaly.entities.Account" scope="session"/>
<jsp:setProperty name="auction" property="*"/>
<%
	auction.setSeller(account.getUsername());
	auction.createAuction();
	response.sendRedirect("SellerHome.jsp");
%>