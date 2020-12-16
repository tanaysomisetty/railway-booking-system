<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" com.cs336.pkg.ApplicationDB "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Train Schedules</title>
</head>
<body>
	<%
		try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		Statement stmt = con.createStatement();
		String stationId = request.getParameter("stationId");
		String stationName = request.getParameter("station");
		//find station name from station and use its id to find trainschedules
		ResultSet rs;
		rs = stmt.executeQuery("select stationId from Station where stationId = " + stationId);
		if (!rs.isBeforeFirst()) {
			//error mereturn to Navigation Menu </a>" ")
			out.print("Station doesnt exist <a href='CustomerRep.jsp'> Click here to return to Navigation Menu </a>");
			return;
		}
		//maybe add total fare?
		rs = stmt.executeQuery(
		"select transitLineName, trainId, originStationId, destinationStationId from TrainSchedule where "
				+ stationName + "  =" + stationId);

		if (!rs.isBeforeFirst()) {
			out.print("No Schedules Match given Station as" + stationId
			+ "<a href='CustomerRep.jsp'> Click here to return to Navigation Menu </a>");
			return;
		}
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("transitLine");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("trainId");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("originStation");
		out.print("</td>");

		out.print("<td>");
		out.print("destinationStation");
		out.print("</td>");
		out.print("</tr>");

		//parse out the results, accessed one tuple at a time
		while (rs.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//Print out current category:
			out.print(rs.getString("transitLineName"));
			out.print("</td>");
			out.print("<td>");
			//Print out current question:
			out.print(rs.getString("trainId"));
			out.print("</td>");
			out.print("<td>");
			//Print out answer:
			out.print(rs.getString("originStationId"));
			out.print("</td>");
			out.print("<td>");
			out.print("destinationStationId");
			out.print("</td>");
			out.print("</tr>");
		}
		out.println(" Schedules for Station:" + stationId + " as a" + stationName + ". <br> <a href='CustomerRep.jsp'> Click here to return to Navigation Menu </a>");
		out.print("</table>");
	} catch (Exception ex) {
		out.print(ex);
		out.print(" failed :()");
	}
	%>

</body>
</html>