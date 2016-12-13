<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="account" class="entities.Account" scope="session"/>
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
      Add User
    </h1>
    <table>
      
        <form method="post" action= "AddUser_action.jsp" name="AddUser">
      <tr>
        <td>
          <label for="username">Username</label>
        </td>
        <td>
          <input name = "username"></input>
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
          <label for="password">Password</label>
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
          <label for="isAdmin">Is Admin</label>
         </td>
         <td><input type="radio" name="isAdmin" value="True"> True<br>
         	<input type="radio" name="isAdmin" value="False"> False<br>
 
         </td>
       
       
      </tr>
      <tr>
        <td>
          <input name="Add" value="Add User" type="submit"/><br>
        </td>
        </form>
        <td>
        <a href="AdminHome.jsp"> <button>Cancel</button></a>
          <br>
        
        </td>
      </tr>
    </table>
</body>
</html>