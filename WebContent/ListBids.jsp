<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="account" class="entities.Account" scope="session"/>
    <jsp:useBean id="auction" class="entities.Auction" scope="page"/>
    <%
    if(!account.isLoggedIn()) response.sendRedirect("Login.jsp"); %>

<%       
	auction.setItemid(Integer.parseInt(request.getParameter("itemid")));
	System.out.println("auctionid: " + auction.getItemid());
    auction.populateAuctionInfo();
	ResultSet rs = auction.getBidderList();
%> 

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bid List for Auction:  <%=auction.getItemName() %></title>
</head>
<body>
	<h1>
      Bid List for Auction:  <%=auction.getItemName() %>
    </h1>
    <% 
    	if(!rs.next()) {
    %>
    	<h3>No matching bids.</h3>
    <%
    	} else {
    %>
    <table>
      <tr>
        <th>
          Customer
        </th>
        <th>
          time
        </th>
        <th>
          Maximum bid
        </th>
      </tr>
    <%
    		do {
    %>
      <tr>
        <td>
          <%=rs.getString("customer")%>
        </td>
        <td>
          <%=rs.getString("bid_time")%>
        </td>
        <td>
          <%=rs.getString("maximum_bid_limit")%>
        </td>
      </tr>
    <% 
    		} while(rs.next());
    %>
    </table>
    <%
    	} 
    %>
</body>
</html>