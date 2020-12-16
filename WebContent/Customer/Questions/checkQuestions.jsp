<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" com.cs336.pkg.ApplicationDB "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Questions</title>
</head>
<body>
	<%
		try {
		//check all questions send by a specific user and see if they are answered
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//SQL statement to check if the question exists
		Statement stmt = con.createStatement();
		String user = session.getAttribute("user").toString();
		ResultSet rs;
		//check if question is in table
		rs = stmt.executeQuery("select category,questionStatement, answer from  Questions" + " where username ='" + user
		+ "'" + " and answer is not null");
		//no questions are answered or no questions sent by user
		if (!rs.isBeforeFirst()) {
			out.print("No answers have been answered by Customer Reprsenative ");
			return;
		}
		//print out contents of query
		else {
			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Category");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Question");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Answer");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results, accessed one tuple at a time
			while (rs.next()) {
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//Print out current category:
		out.print(rs.getString("category"));
		out.print("</td>");
		out.print("<td>");
		//Print out current question:
		out.print(rs.getString("questionStatement"));
		out.print("</td>");
		out.print("<td>");
		//Print out answer:
		out.print(rs.getString("answer"));
		out.print("</td>");
		out.print("</tr>");

			}
			out.print("</table>");

		}
		out.println("Questions answered by Customer Service. <br> <a href='../Customer.jsp'> Click here to return to Navigation Menu </a>");

	} catch (Exception ex) {
		out.print(ex);
		out.print(" failed :()");
	}
	%>
</body>
</html>