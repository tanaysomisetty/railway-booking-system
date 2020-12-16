<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" com.cs336.pkg.ApplicationDB "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Best Customer - Admin</title>
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
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			

			Statement stmt = con.createStatement();
			ResultSet rs;
			
			
			
			out.print("<h1>BEST CUSTOMER(S):</h1>");
			
	
				
			rs = stmt.executeQuery("SELECT r1.username, c.firstName, c.lastName FROM Customer AS c, (SELECT username, sum(fare) AS m1 FROM Reservation GROUP BY username) AS r1 WHERE c.username = r1.username AND r1.m1 = (SELECT MAX(r2.m1) FROM(SELECT sum(fare) AS m1 FROM Reservation GROUP BY username) AS r2)");
			
			while(rs.next()){
				out.print(rs.getString("c.firstname") + " " + rs.getString("c.lastname") + "<br>");
			}
			
			
			
		} catch (Exception ex) {
			out.print(ex);
			out.print(" failed :()");
		}
	
 %>
	<form action="Admin.jsp" method="GET">
		<input type="submit" value="Back">
	</form>
	
 <%
	}
 %>
	
	 <a href = '../logout.jsp'> Log out</a>
</body>
</html>