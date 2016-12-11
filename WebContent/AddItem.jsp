<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	  <body>
    <h1>
      Add Item
    </h1>
    <table>
      <tr>
        <td>
          <label for = "itemName">Item Name</label>
        </td>
        <td>
          <input id = "itemName"></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="category">Category</label>
        </td>
        <td>
          <select>
            <option></option>
            <option>Book</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>
          <label>Start Price:</label>
        </td>
        <td>
          <input></input>
        </td>
      </tr>
      <tr>
        <td>
          <label>Auction Starts:</label>
        </td>
        <td>
          9/12/16
        </td>
      </tr>
      <tr>
        <td>
          <label>Auction Ends:</label>
        </td>
        <td>
          <input type="datetime-local"></input>
        </td>
      </tr>
      <tr>
        <td>
          <label>Description:</label>
        </td>
        <td>
          <textarea></textarea>
        </td>
      </tr>
      <tr>
        <td>
          <button>Add</button>
        </td>
        <td>
          <button>Cancel</button>
        </td>
      </tr>
    </table>
</body>
</html>