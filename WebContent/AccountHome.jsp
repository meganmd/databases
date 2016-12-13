<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="account" class="mmdaly.entities.Account" scope="session"/>
    <%
    if(!account.isLoggedIn()) response.sendRedirect("Login.jsp"); %>
    
<html><head><meta content="text/html; charset=ISO-8859-1" http-equiv="content-type"><title>AccountHome</title></head><body>
<form method="post" action="UpdateProfile.jsp" name="Update">
<input value="Update Profile" name="Update Profile" type="submit"><br> </form>
  
<a href="SellerHome.jsp"> <button>Selling Management</button></a>

<form method="post" action="BidderHome.jsp" name="Bidder">                                                                                                                                   
<input name="Bidding Management" value="Bidding Management" type="submit"><br> </form>

<form method="post" action="ViewFeedback.jsp" name="ViewFeedback"> 
<input name="View My Feedback" value="View My Feedback" type="submit"><br> </form>

<form method="post" action="Logout_action.jsp" name="Logout"> 
<input name="Exit" value="Exit" type="submit"> </form>


</body></html>