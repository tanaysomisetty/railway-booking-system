<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" com.cs336.pkg.ApplicationDB "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reservations for transit Line</title>
</head>
<body>
	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		Statement stmt = con.createStatement();
		String transitLine = request.getParameter("transitLine");
		String date = request.getParameter("date");
		ResultSet rs;
		
		rs = stmt.executeQuery(
		"select username from Reservation where transitLineName='" + transitLine + "' and date='" + date);

		if (!rs.isBeforeFirst()) {
			out.print("No Customers are currently reserving this transitLine exist <a href='CustomerRep'> Click here to return to Navigation Menu </a>");
			return;
		}
		else {
			while(rs.next()){
				out.print(rs.getString("username"));
			}
		}
	}catch (Exception ex) {
		out.print(ex);
		out.print(" failed :()");
	}
	%>

</body>
</html>