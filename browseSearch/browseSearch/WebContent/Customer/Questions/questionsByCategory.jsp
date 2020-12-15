<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View by Category</title>
</head>
<body>
	<form action = "getAnswers.jsp"  method="GET">
		<select name="category" size="3">
			<option selected disabled>Select Category</option>
			<option value="schedule">Train Schedule</option>
			<option value="station">Train Station</option>
			<option value="reservation">Reservation</option>
		</select> <input type="submit" value="submit">
	</form>

</body>
</html>