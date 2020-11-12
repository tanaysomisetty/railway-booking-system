<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import=" com.cs336.pkg.ApplicationDB " %>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Account</title>
</head>
<body>
<%
	try {
		//creates database connection
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		
		//SQL statement to check if user exists
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		String newUser = request.getParameter("username");
		String pass = request.getParameter("password");
		//add erorr check to check length of username and password?
		//query to check if the user exists first
		ResultSet rs;
		rs = stmt.executeQuery("select * from  accounts where username ='" + newUser + "' and password='" + pass + "'");
		//user exists print an error
		if(rs.next()){
			out.println("User already exists please login <a href='index.jsp'> try again </a>");
		}
		else {
		//insert user query
		PreparedStatement createUser = con.prepareStatement("Insert into accounts values (?,?)");
		createUser.setString(1, newUser);
		createUser.setString(2,pass);
		createUser.executeUpdate();
		out.println("User created! <a href='index.jsp'>Click here to Login </a>");
		}
		
		
	}catch (Exception ex) {
		out.print(ex);
		out.print("Insert failed :()");
	}


%>

</body>
</html>