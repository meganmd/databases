<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="account" class="entities.Account" scope="session"/>

<%
	account.createAccount();
	response.sendRedirect("AdminHome.jsp");
%>