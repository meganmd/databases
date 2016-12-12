<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html><head><meta content="text/html; charset=ISO-8859-1" http-equiv="content-type"><title>AccountHome</title></head><body>
<form method="post" action="UpdateProfile.jsp" name="Update">
<input value="Update Profile" name="Update Profile" type="submit"><br> </form>
  
<a href="SellerHome.jsp"> <button>Selling Management</button></a>

<form method="post" action="BidderHome.jsp" name="Bidder">                                                                                                                                   
<input name="Bidding Management" value="Bidding Management" type="submit"><br> </form>

<form method="post" action="LeaveFeedback.jsp" name="LeaveFeedback"> 
<input value="Leave Feedback" name="Leave Feedback" type="submit"><br> </form>

<form method="post" action="Login.jsp" name="Exit"> 
<input name="Exit" value="Exit" type="submit"> <input name="View My Feedback" value="View My Feedback" type="submit"><br> </form>

</body></html>