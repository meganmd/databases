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
      My Feedback
    </h1>
    <table>
      <tr>
        <th>
          Username
        </th>
        <th>
          Item ID
        </th>
        <th>
          Overall Rating
        </th>
        <th>
          Item Quality
        </th>
        <th>
          Delivery
        </th>
        <th>
          Comments
        </th>
      </tr>
      <tr>
        <td>
          BillyR
        </td>
        <td>
          10111
        </td>
        <td>
          5
        </td>
        <td>
          3
        </td>
        <td>
          4
        </td>
        <td>
          I love the color but it's kinda pricey
        </td>
      </tr>
      <tr>
        <td>
          SallyM
        </td>
        <td>
          10133
        </td>
        <td>
          2
        </td>
        <td>
          1
        </td>
        <td>
          1
        </td>
        <td>
          Terrible Customer Service! Package 3 weeks late!!!!
        </td>
      </tr>
    </table>
</body>
</html>