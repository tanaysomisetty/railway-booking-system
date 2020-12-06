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

			Statement stmt = con.createStatement();
			ResultSet rs;
			rs = stmt.executeQuery("select * from CustomerRep");
			/* if (rs.isBeforeFirst()) {
				//error mereturn to Navigation Menu </a>" ")
				out.print("Station doesnt exist <a href='CustomerRep.jsp'> Click here to return to Navigation Menu </a>");
				return;
			}		//int stationId = rs.getInt("stationId");
			rs = stmt.executeQuery(
			"select transitLineName, trainId, originStationId, destinationStationId from TrainSchedule where "
					+ stationType + "  =" + stationId);

			if (rs.isBeforeFirst()) {
				out.print("No Schedules Match given Station as" + stationType
				+ "<a href='CustomerRep'> Click here to return to Navigation Menu </a>");
				return;
			} */
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("username");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("password");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("ssn");
			out.print("</td>");

			out.print("</td>");
			out.print("firstName");
			out.print("</td>");
			
			out.print("<td>");
			out.print("LastName");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results, accessed one tuple at a time
			while (rs.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current category:
				out.print(rs.getString("username"));
				out.print("</td>");
				out.print("<td>");
				//Print out current question:
				out.print(rs.getString("password"));
				out.print("</td>");
				out.print("<td>");
				//Print out answer:
				out.print(rs.getString("ssn"));
				out.print("</td>");
				out.print("</td>");
				out.print(rs.getString("firstName"));
				out.print("</td>");
				out.print("</tr>");
				out.print(rs.getString("lastName"));
				out.print("</td>");
				out.print("</tr>");
				out.print("</tr>");

			}
			// out.println("Customer Reps:" + ". <br> <a href='/CustomerRep.jsp'> Click here to return to Navigation Menu </a>");
			out.print("</table>");
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