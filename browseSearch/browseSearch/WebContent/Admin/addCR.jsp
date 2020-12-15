<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" group25.cs336.pkg. * "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Customer Reps</title>
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
		
		try {
			
		} catch (Exception ex) {
			out.print(ex);
			out.print(" failed :()");
		}
	
 %>
	<form action="addingCR.jsp" method="POST">
		<label for="username">Username:</label>
		<input type="text" id="username" name="username"><br><br>
		<label for="password">Password:</label>
		<input type="text" id="password" name="password"><br><br>
		<label for="ssn">Social Security Number:</label>
		<input type="text" id="ssn" name="ssn"><br><br>
		<label for="fname">First Name:</label>
		<input type="text" id="fname" name="fname"><br><br>
		<label for="lname">Last Name:</label>
		<input type="text" id="lname" name="lname"><br><br>
		<input type="submit" value="Submit">
	</form>
	
	<button href="adminCustomerRep.jsp">Back</button>
	
 <%
	}
 %>
	
	 <a href = '../logout.jsp'> Log out</a>
</body>
</html>