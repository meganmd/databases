<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="auction" class="entities.Auction" scope="session"/>
<jsp:setProperty name="account" property="*"/>

<%
	auction.createAuction();
	response.sendRedirect("SellerHome.jsp");
%>