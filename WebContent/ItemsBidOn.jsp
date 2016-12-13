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
	<h1>
      Items Bid On
    </h1>
    <table>
      <tr>
        <th>
          Item ID
        </th>
        <th>
          Item Name
        </th>
        <th>
          Category
        </th>
        <th>
          Auction Start Time
        </th>
        <th>
          Auction End Time
        </th>
        <th>
          Current Bid
        </th>
        <th>
        </th>
        <th>
        </th>
        <th>
          Winner
        </th>
      </tr>
      <tr>
        <td>
          10111
        </td>
        <td>
          Fundamentals of Database Systems
        </td>
        <td>
          Book
        </td>
        <td>
          2/5/16
        </td>
        <td>
          4/5/16
        </td>
        <td>
          $70
        </td>
        <td>
          <a href="">Info</a>
        </td>
        <td>
        </td>
        <td>
          SallyH
        </td>
      </tr>
      <tr>
        <td>
          10123
        </td>
        <td>
          Elementary Algorithms
        </td>
        <td>
          Book
        </td>
        <td>
          2/7/16
        </td>
        <td>
          4/7/16
        </td>
        <td>
          $30
        </td>
        <td>
          <a href="">Info</a>
        </td>
        <td>
        </td>
        <td>
          HenryB
        </td>
      </tr>
    </table>
</body>
</html>