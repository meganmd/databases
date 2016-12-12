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
      Leave Feedback
    </h1>
    <table>
      <tr>
        <td>
          Item ID
        </td>
        <td>
          10111
        </td>
      </tr>
      <tr>
        <td>
          Item Name
        </td>
        <td>
          Fundamentals of Database Systems
        </td>
      </tr>
      <tr>
        <td>
          <label for="rating">Overall rating</label>
        </td>
        <td>
          <select id = "rating">
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            <option>5</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>
          <label for="quality">Item Quality</label>
        </td>
        <td>
          <input type="radio">1</input>
          <input type="radio">2</input>
          <input type="radio">3</input>
          <input type="radio">4</input>
          <input type="radio">5</input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="delivery">Delivery</label>
        </td>
        <td>
          <input type="radio">1</input>
          <input type="radio">2</input>
          <input type="radio">3</input>
          <input type="radio">4</input>
          <input type="radio">5</input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="comments">Comments</label>
        </td>
        <td>
          <textarea id="comments"></textarea>
        </td>
      </tr>
      <tr>
        <td>
          <button>Rate</button>
        </td>
        <td>
          <button>Cancel</button>
        </td>
      </tr>
    </table>
</body>
</html>