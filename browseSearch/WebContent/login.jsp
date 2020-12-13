<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Interface</title>
</head>
<body>
<%-- Add an Error check to check for user/password length --%>
	<%-- Login Form --%>
	Login:
	<form action = "checkLoginDetails.jsp" method = "POST">
	Username: <input type = "text" name = "username"/> <br>
	Password: <input type = "password" name = "password"/> <br>
	<input type = "submit" value = "Log in">
	</form>
	<br>
	<%-- Create Account Form--%>
	Create an Account:
	<form action = "createAccount.jsp" method= "POST">
	Username: <input type = "text" name = "username"/> <br/>
	Password: <input type = "password" name = "password"/> <br/>
	<input type ="submit" value = "Create Account">
	</form>

</body>
</html>