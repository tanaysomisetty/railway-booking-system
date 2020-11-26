<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ask Questions</title>
</head>
<body>
	<br>
	<!-- Create Simple Question that returns a single value -->
	<form method="get" action="createQuestion.jsp">
		<select name="questionType" size=3>
			<option selected disabled > Select Question Type </option>
			<option value="schedule">Train Schedule</option>
			<option value="station">Train Station</option>
			<option value="reservation">Reservation</option>
		</select>&nbsp;<br>  <br>
		Please Enter a Simple Question: <input type="text" name="question" />
		<br /> <input type="submit" value="submit">
	</form>
	<br>

</body>
</html>