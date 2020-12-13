<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Answered Questions</title>
</head>
<body>
	<form action="checkQuestions.jsp" method="Get">
		<input type="submit" value="View Customer Representative Answers">
	</form>
	<form action='questionsByCategory.jsp' method="Get">
		<input Type="Submit"
			value=" View Questions and Answers by Selecting a Category">
	</form>

	<form action='allQuestions' method="Get">
		<input Type="Submit" value="View all Questions and Answers">
	</form>
</body>
</html>