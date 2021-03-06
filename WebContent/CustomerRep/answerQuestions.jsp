<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" com.cs336.pkg.ApplicationDB "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Answer Questions</title>
</head>
<body>
	<%
		
	try {
		//check all questions send by a specific user and see if they are answered
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//SQL statement to check if the question exists
		Statement stmt = con.createStatement();
		ResultSet rs;
		//check if question is in table
		rs = stmt.executeQuery("select category,questionStatement, username from  Questions where answer is null Order BY username,questionStatement" );
		//no questions are answered or no questions sent by user
		if (!rs.isBeforeFirst()) {
			out.print("No Questions are available <a href='CustomerRep.jsp'> Click here to return to Navigation Page  </a> ");
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
	%>
	<form action = "submitAnswer.jsp" method = 'GET'>
	<%
		while (rs.next()) {
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//Print out current category:
		String category = rs.getString("category");
		out.print(category);
		out.print("</td>");
		out.print("<td>");
		//Print out current question:
		String questionStatement = rs.getString("questionStatement");
		out.print(questionStatement);
		out.print("</td>");
		out.print("<td>");
		//Print out field for user to input answer
		//pass each question and category with answer, hidden
			%>
		<input type = "hidden" name = "category" value =  <%= category %>>
		<input type = "hidden" name = "question" value = <%= questionStatement %>>
		<input type = "hidden" name = "usernames" value = <%= rs.getString("username") %>>
		<input type="text" name = "answer">	
		<% 
		out.print("</td>");
		out.print("</tr>");

	}
	out.print("</table>");

	}

	} catch (Exception ex) {
	out.print(ex);
	out.print(" failed :()");
	}
	%>
	<input type="submit" value="Submit">
	</form>
</body>
</html>