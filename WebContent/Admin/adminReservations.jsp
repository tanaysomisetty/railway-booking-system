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
			
			String resType = request.getParameter("reservationType");

			Statement stmt = con.createStatement();
			ResultSet rs;
			
			
			
			out.print("<h1>RESERVATIONS:</h1>");
			
			
			if(resType.equals("transit")){
				
				rs = stmt.executeQuery
						("select transitLineName, reservationNum, date, username, fare, trainId from Reservation ORDER BY transitLineName");
				
				out.print("<table>");
				
				out.print("<tr>");
				
				out.print("<td>");
				out.print("transitLineName");
				out.print("</td>");
				
				out.print("<td>");
				out.print("reservationNum");
				out.print("</td>");
				
				out.print("<td>");
				out.print("date");
				out.print("</td>");
				
				out.print("<td>");
				out.print("username");
				out.print("</td>");
				
				out.print("<td>");
				out.print("fare");
				out.print("</td>");
				
				out.print("<td>");
				out.print("trainId");
				out.print("</td>");
				
				out.print("</tr>");
				
				while (rs.next()) {
					out.print("<tr>");
					
					out.print("<td>");
					out.print(rs.getString("transitLineName"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(rs.getString("reservationNum"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(rs.getString("date"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(rs.getString("username"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(rs.getString("fare"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(rs.getString("trainId"));
					out.print("</td>");
					
					out.print("</tr>");
				}
				
				
			}
			
			if(resType.equals("customer")){
				
				rs = stmt.executeQuery("select c.lastname, c.firstname, c.username, r.reservationNum, r.date, r.fare, r.transitLineName, r.trainId from Reservation as r, Customer as c WHERE r.username = c.username ORDER BY c.lastname");
				
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
				out.print("transitLineName");
				out.print("</td>");
				
				out.print("<td>");
				out.print("reservationNum");
				out.print("</td>");
				
				out.print("<td>");
				out.print("date");
				out.print("</td>");
				
				out.print("<td>");
				out.print("fare");
				out.print("</td>");
				
				out.print("<td>");
				out.print("trainId");
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
					out.print(rs.getString("r.reservationNum"));
					out.print("</td>");
								
					out.print("<td>");
					out.print(rs.getString("r.date"));
					out.print("</td>");
								
					out.print("<td>");
					out.print(rs.getString("r.fare"));
					out.print("</td>");
								
					out.print("<td>");
					out.print(rs.getString("r.transitLineName"));
					out.print("</td>");
								
					out.print("<td>");
					out.print(rs.getString("r.trainId"));
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