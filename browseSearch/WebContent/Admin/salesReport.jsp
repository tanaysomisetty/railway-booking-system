<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" group25.cs336.pkg. * "%>
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

			Statement stmt = con.createStatement();
			ResultSet rs;
			rs = stmt.executeQuery("select * from Reservation");
			
			String[] months = {"January", "Febrary", "March", "April", "May", "June", 
					"July", "August", "September", "October", "November", "December"};
			double[] sales = new double[12];
			
			while (rs.next()) {
				String date = rs.getString("date");
				int slash = date.indexOf("/");
				String monthString;
				int month;
				
				String fareString = rs.getString("fare");
				double fare = Double.parseDouble(fareString);
				
				if(slash != -1){
					monthString = date.substring(0, slash);
					month = Integer.parseInt(monthString) - 1;
					sales[month] += fare;
				}
			}
			
			
			out.print("<h1>SALES REPORT:</h1>");
			
			
			out.print("<table>");

			out.print("<tr>");
			out.print("<td>");
			out.print("<h4>Month</h4>");
			out.print("</td>");
			out.print("<td>");
			out.print("<h4>Sales</h4>");
			out.print("</td>");
			out.print("</tr>");
			
			out.print("<tr>");
			
			for(int i = 0; i < 12; i ++){
				out.print("<tr>");
				
				out.print("<td>");
				out.print(months[i]);
				out.print("</td>");
				
				out.print("<td>");
				out.print(sales[i]);
				out.print("</td>");
				
				out.print("</tr>");
			
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