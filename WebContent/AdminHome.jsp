<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="account" class="entities.Account" scope="session"/>
    <%
    if(!account.isLoggedIn()) response.sendRedirect("Login.jsp"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta content="text/html; charset=ISO-8859-1" http-equiv="content-type"><title>AdminHome</title></head>
<body>
<form method="post" action="AddUser.jsp" name="Add User">
<input name="Add User" value="Add User" type="submit"><br> </form>
<br>
<form method="post" action="ViewUsers.jsp" name="View Users">
<input name="View Users" value="View Users" type="submit"><br> </form>
<br>
<form method="post" action="SummaryReports.jsp" name="SummaryReport">
<input name="Summary Report" value="Summary Report" type="submit"><br> </form>
<br>
<form method="post" action="CommissionReport.jsp" name="CommissionReport">
<input name="Commission Report" value="Commission Report" type="submit"><br> </form>

<form method="post" action="Logout_action.jsp" name="Logout"> 
<input name="Exit" value="Exit" type="submit"> 

</body></html>

