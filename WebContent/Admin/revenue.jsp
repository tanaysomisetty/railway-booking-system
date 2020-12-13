<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" com.cs336.pkg.ApplicationDB "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Reps - Admin</title>
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
			
			String revType = request.getParameter("revenueType");

			Statement stmt = con.createStatement();
			ResultSet rs;
			
			
			
			out.print("<h1>REVENUE:</h1>");
			
			
			if(revType.equals("transit")){
				
				rs = stmt.executeQuery
						("SELECT transitLineName, SUM(fare) FROM Reservation GROUP BY transitLineName");
				
				out.print("<table>");
				
				out.print("<tr>");
				
				out.print("<td>");
				out.print("transitLineName");
				out.print("</td>");
				
				out.print("<td>");
				out.print("revenue");
				out.print("</td>");
				
				out.print("</tr>");
				
				while (rs.next()) {
					out.print("<tr>");
					
					out.print("<td>");
					out.print(rs.getString("transitLineName"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(rs.getString("sum(fare)"));
					out.print("</td>");
					
					out.print("</tr>");
				}
				
				
			}
			
			if(revType.equals("customer")){
				
				rs = stmt.executeQuery("select c.lastname, c.firstname, c.username, sum(r.fare) from Reservation as r, Customer as c WHERE r.username = c.username GROUP BY c.lastname");
				
				out.print("<table>");
				
				out.print("<tr>");
				
				out.print("<td>");
				out.print("lastName");
				out.print("</td>");
				
				out.print("<td>");
				out.print("firstName");
				out.print("</td>");
				
				out.print("<td>");
				out.print("username");
				out.print("</td>");
				
				out.print("<td>");
				out.print("revenue");
				out.print("</td>");
				
				out.print("</tr>");
				
				while(rs.next()){
					out.print("<tr>");
					
					out.print("<td>");
					out.print(rs.getString("c.lastName"));
					out.print("</td>");
								
					out.print("<td>");
					out.print(rs.getString("c.firstName"));
					out.print("</td>");
								
					out.print("<td>");
					out.print(rs.getString("c.username"));
					out.print("</td>");
								
					out.print("<td>");
					out.print(rs.getString("sum(r.fare)"));
					out.print("</td>");
								
					out.print("</tr>");
				}
			}
			
			
			out.print("</table>");
			
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