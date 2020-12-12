<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" com.cs336.pkg.ApplicationDB "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	try{
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String username = session.getAttribute("user").toString();
		
		String reservationNum = request.getParameter("reservationNum");
		//int reservationNum = Integer.parseInt(request.getParameter("reservationNum"));
		//out.print("reservationNum is " + reservationNum);
		//out.print("username is " + username);
		int newId;
		ResultSet rs1;
		ResultSet rs2;
		rs1 = stmt.executeQuery("select r.reservationNum from Reservation r where r.reservationNum = " + reservationNum + " and r.username = '" + username + "'");
		
		if(!rs1.isBeforeFirst()){
			//can't cancel a non-existing reservation
			%>
			Reservation Number does not exist or was not made for you.  
			<% 
		}
		else{
		
		stmt.executeUpdate("delete from Reservation r where r.reservationNum = " + reservationNum);
		out.print("Reservation Canceled Successfully!");
		}
		
		//String username = session.getAttribute("user").toString();
		

			
	}catch(Exception ex){
				out.print(ex);
				out.print(" failed :()");
	}

%>

<a href = '../Reservations.jsp'> Go back to reservations menu</a> || 
<a href = '../logout.jsp'> Log out</a>

</body>
</html>
