<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="account" class="entities.Account" scope="session"/>
    <%
    if(!account.isLoggedIn()) response.sendRedirect("Login.jsp"); %>

<jsp:setProperty name="account" property="*"/> 
<%       
    ResultSet rs = account.salesSummaryReport();
%> 

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Summary Report</title>
</head>
<body>
	<h1>
      Summary Report
    </h1>
    <% 
    	if(!rs.next()) {
    %>
    	<h3>No matching items.</h3>
    <%
    	} else {
    %>
    <table>
      <tr>
        <th>
          Category
        </th>
        <th>
          Item Id
        </th>
        <th>
          Item Name
        </th>
        <th>
          Final Selling Price
        </th>
        <th>
          Commission
        </th>
        
      </tr>
    <%
    		do {
    %>
      <tr>
        <td>
          <%=rs.getString("item_category")%>
        </td>
        <td>
          <%=rs.getString("item_id")%>
        </td>
        <td>
          <%=rs.getString("item_name")%>
        </td>
        <td>
          <%=rs.getInt("current_bid")%>
        </td>
        <td>
          <%=rs.getInt("commission")%>
        </td>
        
      </tr>
    <% 
    		} while(rs.next());
    %>
    </table>
    <%
    	} 
    %>
     <a href="AdminHome.jsp"> <button>Cancel</button></a>
</body>
</html>