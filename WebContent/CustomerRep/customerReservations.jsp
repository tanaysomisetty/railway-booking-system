<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> View Reservations</title>
</head>
<body>
	<form action = "getCustomers.jsp" method = "GET">
	<br> Please Enter TransitLine Name
	<input type = "text" name = "transitLine">
	<br> Enter Date in format: XX/XX
	<input type = "text" name = "date">
	<input type = "Submit" value = "Submit">
	</form>
</body>
</html>