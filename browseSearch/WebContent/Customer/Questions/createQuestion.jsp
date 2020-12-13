<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" group25.cs336.pkg.* "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//SQL statement to check if the question exists
		Statement stmt = con.createStatement();
		String user = session.getAttribute("user").toString();
		String question = request.getParameter("question");
		String category = request.getParameter("questionType");
		//error check
		if (user == null || question == null){
			out.println("Please make sure to fill out all Fields <a href='Ask.jsp'>try again</a>");
			return;
		}
		if(category == null){
			out.println("Please select a Question Type <a href = 'Ask.jsp'> try again </a>");
			return;
		}
		ResultSet rs;
		//check if question is in table
		rs = stmt.executeQuery("select * from  Questions"  + " where username ='" + user + "' and questionStatement = '" + question + "'" + " and category ='" + category + "'" );
		if(rs.next()){
			out.println("Question Already Asked! Please wait for a Representatitve <a href='Ask.jsp'> try again </a>");
		}
		//insert question
		else {
			String insertTuple = String.format("('%s','%s','%s')",user,question,category);
			stmt.executeUpdate("Insert  into Questions (username,questionStatement,category) values " + insertTuple);
			out.println("Question sent to Customer Service, Please wait for a Reprsenattive to answer. <br> <a href='../Customer.jsp'> Thank you </a>");
		}
	} catch (Exception ex) {
		out.print(ex);
		out.print("Insert failed :()");
	}
	%>

</body>
</html>