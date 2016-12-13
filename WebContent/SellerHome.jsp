<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="account" class="entities.Account" scope="session"/>
    <%
    if(!account.isLoggedIn()) response.sendRedirect("Login.jsp"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta content="text/html; charset=ISO-8859-1" http-equiv="content-type"><title>Selling Management</title></head><body>
<form method="post" action="ListItems.jsp" name="ListItem">
<input name="List Items" value="List Items" type="submit"><br> </form>
<br>
<form method="post" action="AddItem.jsp" name="AddItem">
<input name="Add Item" value="Add Item" type="submit"><br> </form>
<br>
<form method="post" action="AccountHome.jsp" name="AccountHome">
<input name="Return to Menu" value="Return to Menu" type="submit"><br>
<br>
<br>

  

</body></html>