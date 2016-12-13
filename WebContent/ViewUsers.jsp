<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="account" class="mmdaly.entities.Account" scope="page"/> 
<jsp:setProperty name="account" property="*"/> 

    <%
    if(!account.isLoggedIn()) response.sendRedirect("Login.jsp"); %>
<%       
    ResultSet rs = account.getUserList();
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
      User List
    </h1>
    <% 
    	if(!rs.next()) {
    %>
    	<h3>No matching users.</h3>
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
          Phone
        </th>
        <th>
          Password
        </th>
        <th>
          Is Admin
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
          <%=rs.getString("phone")%>
        </td>
        <td>
          <%=rs.getString("password")%>
        </td>
        <td>
          <%=rs.getString("is_admin")%>
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

        <a href="AdminHome.jsp"> <button>Cancel</button></a>
          <br>
        </td>
      </tr>
    </table>
</body>
</html>