<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" group25.cs336.pkg. * "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Customer Reps</title>
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
			String ssnString = request.getParameter("ssn");
			int ssn = Integer.parseInt(ssnString);
			
			//accounttype not selected or password or newUser are null error check
			if(ssnString == ""){
				out.println("Please input a SSN <a href='deleteCR.jsp'>try again</a>");
				return;
			}
			//query to check if the user exists first
			ResultSet rs;
			rs = stmt.executeQuery("select * from CustomerRep" + " where ssn ='" + ssn + "'" );
			//user exists print an error
			if(!rs.next()){
				out.println("User does not exist <a href='deleteCR.jsp'> try again </a>");
			}
			else {
			//insert user query
			stmt.executeUpdate("DELETE FROM CustomerRep WHERE ssn = " + ssn);
		
			out.println("Customer Rep deleted! <a href='adminCustomerRep.jsp'>Go Back </a>");
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