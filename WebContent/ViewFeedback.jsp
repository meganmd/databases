<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="account" class="mmdaly.entities.Account" scope="session"/> 
    <%
    if(!account.isLoggedIn()) response.sendRedirect("Login.jsp"); %>
<%       
    ResultSet rs = account.getFeedback();
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
      My Feedback
    </h1>
    <% 
    	if(!rs.next()) {
    %>
    	<h3>No matching feedback.</h3>
    <%
    	} else {
    %>
    <table>
      <tr>
        <th>
          Auction
        </th>
        <th>
          Overall Rating
        </th>
        <th>
          Quality Rating
        </th>
        <th>
          Delivery Rating
        </th>
        <th>
          Comments
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
          <%=rs.getString("overall_rating")%>
        </td>
        <td>
          <%=rs.getString("quality_rating")%>
        </td>
        <td>
          <%=rs.getString("delivery_rating")%>
        </td>
        <td>
          <%=rs.getString("comments")%>
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

        <a href="SellerHome.jsp"> <button>Cancel</button></a>
          <br>
        </td>
      </tr>
    </table>
</body>
</html>