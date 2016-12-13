<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="account" class="mmdaly.entities.Account" scope="session"/>
    
    <%
    if(!account.isLoggedIn()) response.sendRedirect("Login.jsp"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	  <body>
    <h1>
      Update Profile
    </h1>
    <table>
      <tr>
        <td>
          <label for = "username">Username</label>
        </td>
        <td>
        <form method="post" action= "UpdateProfile_action.jsp" name="UpdateProfile">
          <input name="username" value="<%=account.getUsername()%>" readonly><br>
        </td>
      </tr>
      <tr>
        <td>
          <label for="fname">First Name</label>
        </td>
        <td>
          <input name = "fname"></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="lname">Last Name</label>
        </td>
        <td>
          <input name = "lname"></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="email">Email</label>
        </td>
        <td>
          <input name = "email"></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="phone">Phone</label>
        </td>
        <td>
          <input name = "phone"></input>
        </td>
      </tr>
      <tr>
      <td>
          <label for="sellerRating">Seller Rating</label>
        </td>
        <td>
        <%ResultSet rs = account.sellerRating();
        		  %>
          <input name="sellerRating" value="<%=rs.next()? rs.getString("num"): "Not rated yet"%>" readonly><br>
        </td>
      </tr>
      
      <tr>
        <td>
          <label for="oldPassword">Old Password</label>
        </td>
        <td>
          <input name = "oldPassword"></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="password">New Password</label>
        </td>
        <td>
          <input name = "password"></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="retypePassword">Retype Password</label>
        </td>
        <td>
          <input name = "retypePassword"></input>
        </td>
      </tr>
      <tr>
        <td>
          <input name="Update" value="Update" type="submit"/><br>
        </td>
        </form>
        <td>
        <a href="AccountHome.jsp"> <button>Cancel</button></a>
          <br>
        
        </td>
      </tr>
    </table>
</body>
</html>