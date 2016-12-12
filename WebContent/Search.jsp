<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search</title>
</head>
<body>
	<h1>
      Item Search
    </h1>
    <table>
    <form method = "get" action = "SearchResults.jsp" name = "Search">
      <tr>
        <td>
          <label for = "itemId">Item ID</label>
        </td>
        <td>
          <input id = "itemId" name = "itemId"></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="keyword">Keyword</label>
        </td>
        <td>
          <input id="keyword" name = "keyword"></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="category">Category</label>
        </td>
        <td>
          <select name = "category">
            <option></option>
            <option>Book</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>
          <label>Current Bid</label>
        </td>
        <td>
          <label for="currentBidMin">Min:</label> <input id ="currentBidMin" name = "currentBidMin"></input>
          <label for="currentBidMax">Max:</label> <input id ="currentBidMax" name = "currentBidMax"></input>
        </td>
      </tr>
      <tr>
        <td>
          <label>Auction Time Period:</label>
        </td>
        <td>
          <label for="timePeriodStart">Start:</label>
          <input id = "timePeriodStart" type="datetime-local" name = "timePeriodStart"></input>
          <label for="timePeriodEnd">End:</label>
          <input id = "timePeriodEnd" type="datetime-local" name = "timePeriodEnd"></input>
        </td>
      </tr>
      <tr>
        <td>
          <input name = "Search" type = "submit"></input>
          <!-- <button>Search</button>-->
        </td>
        <td>
          <input type = "reset"></input>
          <!-- <button>Cancel</button>-->
        </td>
      </tr>
    </form>
    </table>
</body>
</html>