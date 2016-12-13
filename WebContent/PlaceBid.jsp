<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="account" class="entities.Account" scope="session"/>
    <%
    if(!account.isLoggedIn()) response.sendRedirect("Login.jsp"); %>
<jsp:useBean id="auction" class = "entities.Auction" scope = "page"/>
<jsp:setProperty name = "auction" property = "*"/>
<%
	auction.populateAuctionInfo();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
      Place Bid
    </h1>
    <table>
      <tr>
        <td>
          Item ID:
        </td>
        <td>
          <%=auction.getItemid() %>
        </td>
      </tr>
      <tr>
        <td>
          Item Name:
        </td>
        <td>
          <%=auction.getItemName() %>
        </td>
      </tr>
      <tr>
        <td>
          Current Bid:
        </td>
        <td>
          <%=auction.getCurrentBid() == -1 ? "No bids yet. Starting price: " + auction.getStartingPrice() : auction.getCurrentBid() %>
        </td>
      </tr>
      <tr>
        <td>
          <label for="maximumBidLimit">Maximum Bid Limit:</label>
        </td>
        <td>
          <form action="PlaceBidAction.jsp" method="post">
          <input name = "auctionid" type = "hidden" value=<%=auction.getItemid() %> />
          <input id ="maximumBidLimit" type = number name = "maximumBidLimit"></input>
        </td>
      </tr>
      <tr>
        <td>
          <input type = "submit" name = "Place Bid"></input>
        </td>
        <td>
          <input type = "reset"/>
        </td>
        </form>
      </tr>
    </table>
</body>
</html>