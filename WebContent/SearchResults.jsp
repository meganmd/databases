<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="search" class="entities.Search" scope="session"/> 
<jsp:setProperty name="search" property="*"/> 
<%       
    ResultSet rs = search.searchDatabase();
%> 

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Results</title>
</head>
<body>
	<h1>
      Search Results
    </h1>
    <% 
    	if(!rs.next()) {
    %>
    	<h3>No matching auctions.</h3>
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
          <%=rs.getString("item_title")%>
        </td>
        <td>
          <%=rs.getString("item_category")%>
        </td>
        <td>
          <%=rs.getString("start_date")%>
        </td>
        <td>
          <%=rs.getString("end_date")%>
        </td>
        <td>
          <%=rs.getString("current_bid")%>
        </td>
        <td>
          <a href="">Info</a>
        </td>
        <td>
        </td>
        <td>
          <a href="">Bid</a>
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