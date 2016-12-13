<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="account" class="mmdaly.entities.Account" scope="session"/>
<jsp:setProperty name="account" property="*"/>
<%
	try{
	System.out.print(request.getParameter("isAdmin"));
	account.createAccount(request.getParameter("retypePassword"));
	response.sendRedirect("AdminHome.jsp");
	}
	catch (IllegalArgumentException e){
		response.sendRedirect("AddUser.jsp");
	}
%>