<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" com.cs336.pkg.ApplicationDB "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Viewing existing Reservations</title>
</head>
<body>
<%
	try{
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs;
		String username = session.getAttribute("user").toString();
		String curDate = request.getParameter("curDate");
		rs = stmt.executeQuery("select r.reservationNum, r.date, r.username, r.fare, r.transitLineName, r.trainId from Reservation r where r.username = '" + username + "' and r.date <= '" + curDate + "'");
		if(rs.isBeforeFirst()){
			out.print("<table border='1'>");
			
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<th>");
			//print out the column header
			out.print("Reservation Number");
			out.print("</th>");
			
			//make a column
			out.print("<th>");
			//print out the column header
			out.print("Date");
			out.print("</th>");
			
			out.print("<th>");
			//print out the column header
			out.print("Username");
			out.print("</th>");
			
			out.print("<th>");
			//print out the column header
			out.print("Fare $");
			out.print("</th>");
			
			out.print("<th>");
			//print out the column header
			out.print("Transit Line Name");
			out.print("</th>");
			
			out.print("<th>");
			//print out the column header
			out.print("Train Id");
			out.print("</th>");
			
			
			
			out.print("</tr>");
			
			while(rs.next()){
				out.print("<tr>");
				out.print("<td style='text-align:center'>");
				//print out the column header
				out.print(rs.getString("reservationNum"));
				out.print("</td>");
				
				out.print("<td style='text-align:center'>");
				out.print(" " + rs.getString("date"));
				out.print("</td>");

				out.print("<td style='text-align:center'>");
				out.print(rs.getString("username"));
				out.print("</td>");
				
				out.print("<td style='text-align:center'>");
				out.print(rs.getString("fare"));
				out.print("</td>");
				
				out.print("<td style='text-align:center'>");
				out.print(rs.getString("transitLineName"));
				out.print("</td>");
				
				out.print("<td style='text-align:center'>");
				out.print(rs.getString("trainId"));
				out.print("</td>");
				

				out.print("</tr>");
			}
			out.print("</table>");
		}
		else{
			out.print("There is no past reservations");
		}
	}
	catch(Exception ex){
		out.print(ex);
		out.print("Exception at viewPast catch");
	}
					
%>
<a href = '../Reservations.jsp'> Go to back to reservations menu</a> || 
<a href = '../logout.jsp'> Log out</a>

</body>
</html>
