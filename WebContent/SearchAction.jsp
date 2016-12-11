<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="search" class="entities.Search" scope="session"/> 
<jsp:setProperty name="search" property="*"/> 
<%       
    boolean validUser = emp.login();
    irahal.companyDB.DatabaseConnection.closeDBConnection();
    if(!validUser)  	
        response.sendRedirect("Login.html");
    else
        response.sendRedirect("Menu.html");
%> 

