<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="styles/index.css">
<title>User Interface</title>
</head>
<body>
	<%-- Login Form --%>
	<div class="navbar">
		<p>Group 25 Railway Booking</p>
	</div>
	Login:

	<form action="checkLoginDetails.jsp" method="POST">
		Still didnt set up Admin! Please select Account Type <input
			type="radio" name="account" value="Admin" />Admin <br> <input
			type="radio" name="account" value="Customer" />Customer <input
			type="radio" name="account" value="CustomerRep" /> Customer
		Representative <br> Username: <input type="text" name="username" />
		<br> Password: <input type="password" name="password" /> <br>
		<input type="submit" value="Log in">
	</form>
	<br>
	<%-- Create Account Form--%>
	Create an Account:
	<form action="accountCreation.jsp" method="GET">
		<input type="submit" value="Create Account">
	</form>

</body>
</html>