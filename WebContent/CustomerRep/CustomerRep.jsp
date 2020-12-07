<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Representative</title>
</head>
<body>
<%
	//then session isn't set and user didn't log in
	if (session.getAttribute("user") == null){
 %>
 You are not logged in <br/>
 <a href= "../index.jsp"> Please Login</a>
 <%
	} else {
	
 %>
 Welcome <%=session.getAttribute("user")%> 	<%-- display username stored in session --%> 

 <%
	}
 %>
	<!-- Buttons for each Option, Browse and Search, Reservations, Questions -->
	<form action="answerQuestions.jsp" method="GET">
		<input type="submit" value="Answer Pending Questions">
	</form>
	<form action="schedules.jsp" method="GET">
		<input type="submit" value="Train Schedules">
	</form>
	<form action="customerReservations.jsp" method="GET">
		<input type="submit" value="Reservations by Transit Line">
	</form>
	
	
	 <a href = '../logout.jsp'> Log out</a>
</body>
</html>