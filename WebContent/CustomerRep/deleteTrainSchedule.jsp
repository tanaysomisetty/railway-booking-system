<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" com.cs336.pkg.ApplicationDB "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Schedule</title>
</head>
<body>
	<%
		ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	String transitLine = request.getParameter("transitLine");
	String trainId = request.getParameter("trainId");
	ResultSet rs;
	//check if train schedule exists
	rs = stmt.executeQuery("Select transitLineName trainId  from TrainSchedule where transitLineName ='" + transitLine
			+ "' and trainId = " + trainId + "");
	if (!rs.isBeforeFirst()) {
		out.print(
		"No Train Schedules exist with given trainsitLine and trainId <a href='CustomerRep'> Click here to return to Navigation Menu </a>");
		return;
	}

	stmt.executeUpdate("Delete from TrainSchedule where transitLineName ='" + transitLine
			+ "' and trainId = " + trainId);
	out.println(
			" Attribute has been updated Thank you! Click here to return to Navigation Page <br> <a href='CustomerRep.jsp'> Click here to return to Navigation Page  </a>");
	%>
</body>
</html>