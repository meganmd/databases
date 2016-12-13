<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="account" class="entities.Account" scope="session"/>
    <%
    if(!account.isLoggedIn()) response.sendRedirect("Login.jsp"); %>
<jsp:setProperty name="account" property="*"/> 
<%       
    ResultSet rs = account.overallCommissionReport();
%> 

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Overall Commission Report</title>
</head>
<body>
	<h1>
      Overall Commission Report
    </h1>
    <% 
    	if(!rs.next()) {
    %>
    	<h3>No matching report.</h3>
    <%
    	} else {
    %>
    <table>
      <tr>
        <th>
          Username
        </th>
        <th>
          First Name
        </th>
        <th>
          Last Name
        </th>
        <th>
          Email
        </th>
        <th>
          Seller Rating
        </th>
        <th>
          Commissions
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
          <%=rs.getString("username")%>
        </td>
        <td>
          <%=rs.getString("fname")%>
        </td>
        <td>
          <%=rs.getString("lname")%>
        </td>
        <td>
          <%=rs.getString("email")%>
        </td>
        <td>
          <%=rs.getString("rating")%>
        </td>
        <td>
          <%=rs.getString("commissions")%>
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