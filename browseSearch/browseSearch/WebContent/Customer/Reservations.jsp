<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservations</title>
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
		/*
		<form action="Reservations/viewExisting.jsp" method="GET">
		<input type="submit" value="View or Cancel a Current/Existing Reservation">
		</form>
		
		<form action="Reservations/viewPast.jsp" method="GET">
		<input type="submit" value="View Past Reservations">
		</form>
		*/
	
 %>
Reservations Menu, Please select an option:

	<!-- Buttons for each Option, Browse and Search, Reservations, Questions
		Need to code Search and Reservations.jsp -->
	<form action="Reservations/makeReservation.jsp" method="GET">
		<input type="submit" value="Make a new reservation">
	</form>
	<form action="Reservations/viewExisting.jsp" method="POST">
		To view existing reservations, in the format MM/DD
		<br> please input current date: <input type="text" name="curDate" /> <br>
	 <input
			type="submit" value="View or Cancel a Current/Existing Reservation">
	</form>
	<form action="Reservations/viewPast.jsp" method="GET">
		To view past reservations, in the format MM/DD
		<br> please input current date: <input type="text" name="curDate" /> <br>
	 <input
			type="submit" value="View Past Reservations">
	</form>
<%
	}
 %>
<a href = './Customer.jsp'> Go back to Customer Menu</a> <br>
<a href = '../logout.jsp'> Log out</a>
</body>
</html>