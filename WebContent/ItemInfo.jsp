<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="account" class="mmdaly.entities.Account" scope="session"/>
    <%
    if(!account.isLoggedIn()) response.sendRedirect("Login.jsp"); %>
<jsp:useBean id="auction" class = "mmdaly.entities.Auction" scope = "page"/>
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
      Fundamentals of Database Systems
    </h1>
    <table>
      <tr>
        <td>
          Item ID
        </td>
        <td>
          <%=auction.getItemid() %>
        </td>
      </tr>
      <tr>
        <td>
          Item name:
        </td>
        <td>
		  <%=auction.getItemName() %>
        </td>
      </tr>
      <tr>
        <td>
          Category:
        </td>
        <td>
		  <%=auction.getItemCategory() %>
        </td>
      </tr>
      <tr>
        <td>
          Start Price:
        </td>
        <td>
		  <%=auction.getStartingPrice() %>
        </td>
      </tr>
      <tr>
        <td>
          Auction Start Date:
        </td>
        <td>
          <%=auction.getStartTime() %>	  
        </td>
      </tr>
      <tr>
        <td>
          Auction End Date:
        </td>
        <td>
		  <%=auction.getEndTime() %>
        </td>
      </tr>
      <tr>
        <td>
          Description:
        </td>
        <td>
		  <%=auction.getItemDescription() %>
        </td>
      </tr>
    </table>
</body>
</html>