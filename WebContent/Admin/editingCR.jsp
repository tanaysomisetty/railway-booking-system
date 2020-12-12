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
			String newCR = request.getParameter("username");
			String pass = request.getParameter("password");
			String ssn = request.getParameter("ssn");
			String firstName = request.getParameter("fname");
			String lastName = request.getParameter("lname");
			
			// null error check
			if(pass == "" && newCR == "" && ssn == "" && firstName == "" && lastName == ""){
				out.println("Please make sure to fill out at least one field <a href='editCR.jsp'>try again</a>");
				return;
			}
			
			ResultSet rs;
			rs = stmt.executeQuery("select * from CustomerRep" + " where username ='" + newCR + "'" );
			
			// edit user
			if(newCR != ""){
				stmt.executeUpdate("UPDATE CustomerRep SET username = '" + newCR + "' WHERE ssn = " + ssn);
			}
			
			if(pass != ""){
				stmt.executeUpdate("UPDATE CustomerRep SET password = '" + pass + "' WHERE ssn = " + ssn);
			}
			
			if(firstName != ""){
				stmt.executeUpdate("UPDATE CustomerRep SET firstName = '" + firstName + "' WHERE ssn = " + ssn);
			}
			
			if(lastName != ""){
				stmt.executeUpdate("UPDATE CustomerRep SET lastName = '" + lastName + "' WHERE ssn = " + ssn);
			}
			
			out.println("Customer Rep edited!");
			out.println("<a href='adminCustomerRep.jsp'>Go Back </a>");
			
			
		} catch (Exception ex) {
			out.print(ex);
			out.print(" failed :()");
		}
	
 %>
	
 <%
	}
 %>
	
	 <a href = '../logout.jsp'> Log out</a>
</body>
</html>