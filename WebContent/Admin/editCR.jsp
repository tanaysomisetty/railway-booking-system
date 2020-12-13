<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" com.cs336.pkg.ApplicationDB "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Customer Reps</title>
</head>
<body>
<% java.lang.Integer ssn=0; %>
<%
	//then session isn't set and user didn't log in
	if (session.getAttribute("user") == null){
 %>
 You are not logged in <br/>
 
 <a href= "index.jsp"> Please Login</a>
 <%
	} else {
		
		try {
			
			//creates database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			
			//SQL statement to check if user exists
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form at the index.jsp
			String ssnString = request.getParameter("ssn");
			ssn = Integer.parseInt(ssnString);

			
			//accounttype not selected or password or newUser are null error check
			if(ssnString == ""){
				out.println("Please make sure to fill out all fields <a href='selectEditCR.jsp'>try again</a>");
				return;
			}
			//query to check if the user exists first
			ResultSet rs;
			rs = stmt.executeQuery("select * from CustomerRep" + " where ssn ='" + ssn + "'" );
			//user exists print an error
			if(!rs.next()){
				out.println("User does not exist <a href='selectEditCR.jsp'> try again </a>");
			}
			else {
				out.println("CURRENT VALUES:");
				out.println("<br>");
				out.println("Username: " + rs.getString("username"));
				out.println("<br>");
				out.println("Password: " + rs.getString("password"));
				out.println("<br>");
				out.println("SSN: " + ssnString);
				out.println("<br>");
				out.println("First: " + rs.getString("firstName"));
				out.println("<br>");
				out.println("Last: " + rs.getString("lastName"));
				out.println("<br><br>");
				out.println("NEW VALUES:");
				out.println("<br>");
				
				String socsec = ssnString;
				
			}

			
			
		} catch (Exception ex) {
			out.print(ex);
			out.print(" failed :()");
		}
	
 %>
 
 	
	<form action="editingCR.jsp" method="POST">
		<label for="username">Username:</label>
		<input type="text" id="username" name="username"><br><br>
		<label for="ssn">Password:</label>
		<input type="text" id="password" name="password"><br><br>
		<label for="ssn">Social Security Number:</label>
		<input type="text" id="ssn" name="ssn" value=<%= ssn %> readonly><br><br>
		<label for="fname">First Name:</label>
		<input type="text" id="fname" name="fname"><br><br>
		<label for="lname">Last Name:</label>
		<input type="text" id="lname" name="lname"><br><br>
		<input type="submit" value="Submit">
	</form>
	
	<button href="admincustomerRep.jsp">Back</button>
	
 <%
	}
 %>
	
	 <a href = '../logout.jsp'> Log out</a>
</body>
</html>