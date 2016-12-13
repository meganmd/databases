<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<jsp:useBean id="account" class="entities.Account" scope="session"/> 

<%       
    ResultSet rs = account.itemsBidOn();
%> 
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	  <body>
    <h1>
      Items Bid On
    </h1>
    <% 
    	if(!rs.next()) {
    %>
    	<h3>No items bid on.</h3>
    <%
    	} else {
    %>
    <table>
      <tr>
        <th>
          Item ID
        </th>
        <th>
          Item Name
        </th>
        <th>
          Category
        </th>
        <th>
          Auction Start Time
        </th>
        <th>
          Auction End Time
        </th>
        <th>
          Current Bid
        </th>
        <th>
          Winner
        </th>
        <th>
        </th>
        <th>
        </th>
      </tr>
    <%
    		do {
    %>
      <tr>
        <td>
          <%=rs.getString("item_id")%>
        </td>
        <td>
          <%=rs.getString("item_name")%>
        </td>
        <td>
          <%=rs.getString("item_category")%>
        </td>
        <td>
          <%=rs.getString("start_time")%>
        </td>
        <td>
          <%=rs.getString("end_time")%>
        </td>
        <td>
          <%=rs.getString("current_bid")%>
        </td>
        <td>
          <%=rs.getString("winner")%>
        </td>
          
      </tr>
    <% 
    		} while(rs.next());
    %>
    </table>
    <%
    	} 
    %>
    <table>
      <tr>
        <td>

        <a href="BidderHome.jsp"> <button>Cancel</button></a>
          <br>
        </td>
      </tr>
    </table>
</body>
</html>