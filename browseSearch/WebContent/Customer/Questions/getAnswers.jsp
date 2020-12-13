<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="group25.cs336.pkg.*"%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Answers</title>
</head>
<body>
	<%
		//have an account username:QuestionSetter which sets all of the questions needed initially and supplies answers
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		Statement stmt = con.createStatement();
		String user = session.getAttribute("user").toString();
		String category = request.getParameter("category");
		ResultSet rs;
		rs = stmt.executeQuery("select category,questionStatement, answer from  Questions" + " where username ='QuestionSetter' and category = '" + category + "'");
		//no questions are answered or no questions sent by user
		if (!rs.isBeforeFirst()) {
			out.print("No answers have been set up yet!  <a href='../Customer.jsp'> Click here to return to Navigation Menu </a>");
			return;
		}
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
		out.println(" Frequently Asked Questions Answered! for" + category +". <br> <a href='../Customer.jsp'> Click here to return to Navigation Menu </a>");
	} catch (Exception ex) {
		out.print(ex);
		out.print(" failed :()");
	}
	%>
</body>
</html>