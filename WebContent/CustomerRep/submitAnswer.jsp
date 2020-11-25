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
		//check all questions send by a specific user and see if they are answered
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		String[] answers = request.getParameterValues("answer");
		//SQL statement to check if the question exists
		Statement stmt = con.createStatement();
		ResultSet rs;
		//check if question is in table
		rs = stmt.executeQuery("select category,questionStatement, answer from  Questions");
		//no questions are answered or no questions sent by user
		if (!rs.next()) {
			out.print("No Questions are available  ");
			return;
		}
		//update answers
		int i=0;
		while(i < answers.length){
			stmt.executeUpdate("Update Questions set answer = '" + answers[i] +"'" + " where category = '" + rs.getString("category") + "'"  + 
		" and questionStatement = '" + rs.getString("questionStatement") + "'" );
			i++;
			
		}
	}
		catch (Exception ex) {
			out.print(ex);
			out.print(" failed :()");
			}
	%>
</body>
</html>