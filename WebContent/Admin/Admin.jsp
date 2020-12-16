<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
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
	<form action="adminCustomerRep.jsp" method="GET">
		<input type="submit" value="Customer Representatives">
	</form>
	<form action="salesReport.jsp" method="GET">
		<input type="submit" value="Sales Report">
	</form>
	
	<form action="adminReservations.jsp" method="GET">
		<input type="radio" name="reservationType" value="transit">Reservations By Transit Line
		<input type="radio" name="reservationType" value="customer">Reservations By Customer Name
		<input type="submit" value="Reservations">
	</form>
	<form action="revenue.jsp" method="GET">
		<input type="radio" name="revenueType" value="transit">Revenue By Transit Line
		<input type="radio" name="revenueType" value="customer">Revenue By Customer Name
		<input type="submit" value="Revenue">
	</form>
	<form action="bestCustomer.jsp" method="GET">
		<input type="submit" value="Best Customer">
	</form>
	<form action="activeTransitLines.jsp" method="GET">
		<input type="submit" value="Most Active Transit Lines">
	</form>
	
	 <a href = '../logout.jsp'> Log out</a>
</body>
</html>