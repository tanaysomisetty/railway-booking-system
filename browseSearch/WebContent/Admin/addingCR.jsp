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
			//creates database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			
			//SQL statement to check if user exists
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form at the index.jsp
			String newCR = request.getParameter("username");
			String pass = request.getParameter("password");
			String ssnString = request.getParameter("ssn");
			int ssn = Integer.parseInt(ssnString);
			String firstName = request.getParameter("fname");
			String lastName = request.getParameter("lname");
			
			//accounttype not selected or password or newUser are null error check
			if(pass == "" || newCR == "" || ssnString == "" || firstName == "" || lastName == ""){
				out.println("Please make sure to fill out all fields <a href='addCR.jsp'>try again</a>");
				return;
			}
			//query to check if the user exists first
			ResultSet rs;
			rs = stmt.executeQuery("select * from CustomerRep" + " where username ='" + newCR + "'" );
			//user exists print an error
			if(rs.next()){
				out.println("User already exists <a href='addCR.jsp'> try again </a>");
			}
			else {
			//insert user query
			String insertTuple = String.format("('%s','%s',%s,'%s','%s')",newCR,pass,ssn,firstName,lastName);
			stmt.executeUpdate("Insert into CustomerRep " +" (username,password,ssn,firstName,lastName) values " + insertTuple );
		
			out.println("Customer Rep added! <a href='adminCustomerRep.jsp'>Go Back </a>");
			}
			
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