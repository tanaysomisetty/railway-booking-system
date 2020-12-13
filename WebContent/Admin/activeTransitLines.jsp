<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" com.cs336.pkg.ApplicationDB "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Active Transit Lines - Admin</title>
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
			
			
			
			out.print("<h1>FIVE MOST ACTIVE TRANSIT LINES:</h1>");
			
	
			rs = stmt.executeQuery("SELECT transitLineName, COUNT(reservationNum) AS res FROM Reservation GROUP BY transitLineName ORDER BY res DESC LIMIT 5");
			out.println("The Five Most Active Transit Lines Are: ");
			out.print("<ol>");
			while(rs.next()){
				out.print("<li>" + rs.getString("transitLineName") + "</li>");
			}
			out.print("</ol>");
			
			
			
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