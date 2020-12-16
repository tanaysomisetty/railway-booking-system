<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" com.cs336.pkg.ApplicationDB "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Edit Customer Reps</title>
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
	<form action="editCR.jsp" method="POST">
		<label for="ssn">Social Security Number:</label>
		<input type="text" id="ssn" name="ssn"><br><br>
		<input type="submit" value="Submit">
	</form>
	<form action = "admincustomerRep.jsp" method = "POST">
	<input type = "submit" value = "Back">
	</form>
	
 <%
	}
 %>
	
	 <a href = '../logout.jsp'> Log out</a>
</body>
</html>