<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="account" class="entities.Account" scope="session"/>
<jsp:setProperty name="account" property="*"/>
<%
	account.logout();
	response.sendRedirect("Login.jsp");
%>