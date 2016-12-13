<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="account" class="mmdaly.entities.Account" scope="session"/>
    <%
    if(!account.isLoggedIn()) response.sendRedirect("Login.jsp"); %>
<!DOCTYPE html SYSTEM "about:legacy-compat">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	  <body>
    <h1>
      Add Auction
    </h1>
    <form type = "post" action ="AddItem_action.jsp">
    <table>
      <tr>
        <td>
          <label for = "itemName">Item Name</label>
        </td>
        <td>
          <input id = "itemName" name="itemName"></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="category" >Category</label>
        </td>
        <td>
          <input id ="category" name="itemCategory"/>
        </td>
      </tr>
      <tr>
        <td>
          <label>Start Price:</label>
        </td>
        <td>
          <input name="startingPrice" type = "number" name="startingPrice"></input>
        </td>
      </tr>
      <tr>
        <td>
          <label>Auction Starts (yyyy-MM-dd):</label>
        </td>
        <td>
          <input type="date" name="startTime"></input>
        </td>
      </tr>
      <tr>
        <td>
          <label>Auction Ends (yyyy-MM-dd):</label>
        </td>
        <td>
          <input type="date" name="endTime"></input>
        </td>
      </tr>
      <tr>
        <td>
          <label>Description:</label>
        </td>
        <td>
          <textarea name="itemDescription"></textarea>
        </td>
      </tr>
      <tr>
        <td>
          <input name="Add" value="Add Item" type="submit"/><br>
        </td>
        </form>
        <td>
        <a href="SellerHome.jsp"> <button>Cancel</button></a>
          <br>
        
        </td>
      </tr>
    </table>
   </form>
</body>
</html>