<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <!-- note the show.jsp will be invoked when the choice is made -->
	<!-- The next lines give HTML for radio buttons being displayed -->
<form action = "createAccount.jsp" method= "POST">
	<label for="username">Username:</label>
	<input type="text" id="username" name="username"><br><br>
	<label for="password">Password:</label>
	<input type="text" id="password" name="password"><br><br>
	<label for="email">Email:</label>
	<input type="text" id="email" name="email"><br><br>
	<label for="fname">First Name:</label>
	<input type="text" id="fname" name="fname"><br><br>
	<label for="lname">Last Name:</label>
	<input type="text" id="lname" name="lname"><br><br>
	<input type="submit" value="Create Account">
	</form>
</body>
</html>