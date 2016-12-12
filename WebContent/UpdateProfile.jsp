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
      Update Profile
    </h1>
    <table>
      <tr>
        <td>
          <label for = "username">Username</label>
        </td>
        <td>
        <form method="post" action= "UpdateProfile_action.jsp" name="UpdateProfile">
          <input id = "username"></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="fname">First Name</label>
        </td>
        <td>
          <input></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="lname">Last Name</label>
        </td>
        <td>
          <input></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="email">Email</label>
        </td>
        <td>
          <input></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="phone">Phone</label>
        </td>
        <td>
          <input></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="sellerRating">Seller Rating</label>
        </td>
        <td>
          <input></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="numSellerRatings">Number of Seller Ratings</label>
        </td>
        <td>
          <input></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="password">Old Password</label>
        </td>
        <td>
          <input></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="newPassword">New Password</label>
        </td>
        <td>
          <input></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="retypePassword">Retype Password</label>
        </td>
        <td>
          <input></input>
        </td>
      </tr>
      <tr>
        <td>
          <input name="Update" value="Update" type="submit"/><br>
        </td>
        </form>
        <td>
        <a href="AccountHome.jsp"> <button>Cancel</button></a>
          <br>
        
        </td>
      </tr>
    </table>
</body>
</html>