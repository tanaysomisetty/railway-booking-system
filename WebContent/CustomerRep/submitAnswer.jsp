<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" com.cs336.pkg.ApplicationDB "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Answers Submitted!</title>
</head>
<body>
	<%
	try {
		//need to fix submit
		//check all questions send by a specific user and see if they are answered
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		String[] answers = request.getParameterValues("answer");
		String[] questions = request.getParameterValues("question");
		String[] category = request.getParameterValues("category");
		String[] usernames = request.getParameterValues("usernames");
		//SQL statement to check if the question exists
		Statement stmt = con.createStatement();
		ResultSet rs;
		//check if question is in table
			rs = stmt.executeQuery("select category,questionStatement, username from  Questions where answer is null Order BY username,questionStatement" );
		//no questions are answered or no questions sent by user
		if (!rs.next()) {
			out.print("No Questions are available <a href='CustomerRep.jsp'> Click here to return to Navigation Page  </a>  ");
			return;
		}
		//update answers
		int i=0;
		while(i < answers.length){
			if(answers[i].equals("")){
				continue;
			}
			stmt.executeUpdate("Update Questions set answer = '" + answers[i] +"'" + " where category = '" + rs.getString("category") + "'"  + 
		" and questionStatement = '" + rs.getString("questionStatement") + "' and username = '" + rs.getString("username") +"'" );
			i++;
			
		}
		out.println("Question Answered Thank you! Click here to return to Navigation Page <br> <a href='CustomerRep.jsp'> Click here to return to Navigation Page  </a>");
	}
		catch (Exception ex) {
			out.print(ex);
			out.print(" failed :()");
			}
	%>
</body>
</html>