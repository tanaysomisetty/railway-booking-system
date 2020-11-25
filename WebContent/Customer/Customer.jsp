<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer</title>
</head>
<body>
<%
	//then session isn't set and user didn't log in
	if (session.getAttribute("user") == null){
 %>
 You are not logged in <br/>
 <a href= "index.jsp"> Please Login</a>
 <%
	} else {
	
 %>
 Welcome <%=session.getAttribute("user")%> 	<%-- display username stored in session --%> 

 <%
	}
 %>
	<!-- Buttons for each Option, Browse and Search, Reservations, Questions -->
	<form action="Search.jsp" method="GET">
		<input type="submit" value="Browse & Search">
	</form>
	<form action="Reservations.jsp" method="GET">
		<input type="submit" value="Reservations">
	</form>
	<form action="Questions.jsp" method="GET">
		<input type="submit" value="Questions">
	</form>
	
	<form action = "checkQuestions.jsp" method = "Get">
	<input type="submit" value="Check status of sent Questions">
	</form>
	
	 <a href = '../logout.jsp'> Log out</a>
</body>
</html>